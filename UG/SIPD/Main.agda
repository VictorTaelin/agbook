module UG.SIPD.Main where

open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.print
open import Data.IO.pure
open import Data.Unit.Type
open import Data.String.Type
open import Data.List.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Int.Type
open import Data.Float.Type
open import Data.Pair.Type
open import UG.SIPD.State.Type
open import UG.SIPD.State.init
open import UG.SM.Game.Type
open import UG.SM.Type
open import UG.SM.Time.time-to-tick
open import Data.Bool.Type
open import Concurrent.Channel.Type
open import Concurrent.Channel.write-channel
open import Concurrent.Channel.new-channel
open import Concurrent.Channel.read-channel
open import Network.WebSocket.WSConnection
--open import Network.WebSocket.receive-data
open import Network.WebSocket.run-concurrent-client
open import Data.Result.Type
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Nat.add
open import Data.Nat.mul
open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show renaming (show to jshow)
open import Data.Maybe.Type
open import Data.Function.case
open import UG.SM.new-mach
open import UG.SM.register-action
open import UG.SM.compute
open import UG.SM.TimedAction.Type
open import UG.SIPD.FFI.Window.Type
open import UG.SIPD.FFI.Window.create-window
open import UG.SIPD.FFI.Renderer.Type
open import UG.SIPD.FFI.now
open import UG.SIPD.FFI.Renderer.create-renderer
open import Data.List.foldl
open import Data.List.foldr
open import Data.List.take
open import Data.List.map
open import UG.SIPD.FFI.quit-video
open import UG.SIPD.FFI.init-video
open import UG.SIPD.FFI.draw
open import UG.SIPD.FFI.head
open import UG.SIPD.FFI.cons
open import UG.SIPD.FFI.tail
open import UG.SIPD.FFI.pack
open import UG.SIPD.FFI.show renaming (show to bshow)
open import UG.SIPD.FFI.Event
open import UG.SIPD.FFI.get-events
open import UG.SIPD.FFI.ByteString
open import UG.SIPD.FFI.unpack
open import UG.SIPD.FFI.Word8
open import UG.SIPD.FFI.word8-to-nat
open import Data.Nat.div
open import Data.List.reverse
open import UG.SIPD.FFI.nat-to-word8
open import Network.WebSocket.receive-binary-data
open import UG.SIPD.FFI.show renaming (show to binShow)

fps : Nat
fps = 60

initialState : State
initialState = init

event-eq : Event → Event → Bool
event-eq _ _ = False

handleSingleEv : Event → State → State
handleSingleEv (MouseClick LeftButton _ _) (MkState count) = MkState (Succ count)
handleSingleEv _ game = game

tick : State → State
tick s = s

game : Game State Event
game = record 
  { init = initialState
  ; when = handleSingleEv
  ; tick = tick
  }

handle-websocket : Channel ByteString → WSConnection → IO Unit
handle-websocket channel connection = do
  msg <- receive-binary-data connection
  write-channel channel msg
  handle-websocket channel connection

handle-json-result : Result (Reply JSON) Error → IO Unit
handle-json-result (Done reply) = print ("Received and parsed JSON: " ++ jshow (Reply.value reply))
handle-json-result (Fail error) = print ("Failed to parse JSON")

read-u48 : ByteString -> Nat
read-u48 bs = do
  let bytes = take 6 (unpack bs)
  let values = map word8-to-nat bytes
  foldr (λ x acc -> x + (256 * acc)) 0 values 

nat-to-bytes : Nat -> List Word8
nat-to-bytes n = reverse (go n 6) 
  where
    go : Nat -> Nat -> List Word8
    go _ 0 = []
    go m (Succ k) = (nat-to-word8 m) :: (go (div m 256) k)

write-u48 : Nat -> ByteString
write-u48 n = pack-w8 (nat-to-bytes n)

click-event : Event
click-event = MouseClick LeftButton 0.0 0.0

decode : ByteString -> TimedAction Event
decode bs = record
  { action = click-event ; time = 1 }
  
-- FIXME not getting results correctly
handle-bs-result : ByteString -> (Mach State Event) -> IO (Mach State Event)
handle-bs-result bs mach = do
  let tag = head bs
  print ( "tag is: " ++ (bshow (cons tag (pack ""))))
  let rest = tail bs
  let room = read-u48 rest
  print ( "room is " ++ (show room))
  let rest2 = pack-w8 (take 6 (unpack rest))
  let time = read-u48 rest2
  print ( "time is " ++ (show time))
  let msg = pack-w8 (take 6 (unpack rest2))
  print ( "msg is " ++ (bshow msg))

  -- this will handle a bytestring result which should be decoded in an action
  let received-event = decode bs

  let new-sm = register-action mach received-event
  pure new-sm

process-messages : Mach State Event -> Channel ByteString -> IO (Mach State Event)
process-messages mach channel = do
  maybe-msg <- read-channel channel
  case maybe-msg of λ where
    (Some msg) -> do
      new-mach <- handle-bs-result msg mach
      pure new-mach
    None -> do 
      pure mach

initial-mach : Mach State Event
initial-mach = new-mach 60 event-eq

time-action : Nat -> Event -> TimedAction Event
time-action time event = record { action = event ; time = time }

register-events : Mach State Event -> List Event -> IO (Mach State Event)
register-events mach events = do
  -- time <- now
  let time = 10
  let timed-actions = map (time-action time) events
  let final-mach = foldl (λ acc-mach action → register-action acc-mach action) mach timed-actions
  pure final-mach

loop : (Mach State Event) -> Window -> Renderer -> State -> (Channel ByteString -> IO (Mach State Event)) -> Channel ByteString -> IO State
loop mach window renderer state process-message channel = do

  events <- get-events
  registered-mach <- register-events mach events

  -- new-mach <- process-message channel

  time-now <- now

  --let newState = compute registered-mach game (time-to-tick registered-mach time-now)
  let newState = compute registered-mach game 100

  -- let newState = foldl (λ state event → Game.when game event state) state events

  draw window renderer state
  loop registered-mach window renderer newState (λ chan -> process-message chan) channel

  
main : IO Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"

  chan <- new-channel

  print ("Connecting to WebSocket server")
  --run-concurrent-client host port path (handle-websocket chan)

  init-video

  window <- create-window 
  renderer <- create-renderer window

  loop initial-mach window renderer initialState (λ chan -> process-messages initial-mach chan) chan

  quit-video



