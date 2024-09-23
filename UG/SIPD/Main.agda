module UG.SIPD.Main where

open import Base.Bool.Type
open import Base.Float.Type
open import Base.Function.case
open import Base.IO.Type
open import Base.IO.Monad.bind
open import Base.IO.print
open import Base.IO.Monad.pure
open import Base.Int.Type
open import Base.JSON.Type
open import Base.JSON.parse
open import Base.JSON.show renaming (show to jshow)
open import Base.List.Type
open import Base.List.foldl
open import Base.List.foldr
open import Base.List.map
open import Base.List.reverse
open import Base.List.take
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.show
open import Base.Pair.Type
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Result.Type
open import Base.String.Type
open import Base.String.append
open import Base.Unit.Type
open import Concurrent.Channel.Type
open import Concurrent.Channel.new-channel
open import Concurrent.Channel.read-channel
open import Concurrent.Channel.write-channel
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-binary-data
open import Network.WebSocket.receive-data
open import Network.WebSocket.run-concurrent-client
open import Base.ByteString.Type
open import UG.SIPD.Event.Type
open import UG.SIPD.Event.Click
open import UG.SIPD.Renderer.Type
import UG.SIPD.Renderer.create as Renderer
open import UG.SIPD.Window.Type
import UG.SIPD.Window.create as Window
open import Base.Word8.Type
open import Base.ByteString.cons
open import UG.SIPD.draw
open import UG.SIPD.Event.get-events
open import Base.ByteString.head
import UG.SIPD.Video.init as Video
open import Base.Word8.from-nat
open import Base.Time.now
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import UG.SIPD.Video.quit
open import Base.ByteString.show renaming (show to bshow)
open import Base.ByteString.tail
open import Base.ByteString.unpack
open import Base.Word8.to-nat
open import UG.SIPD.State.Type
open import UG.SIPD.State.init
open import UG.SM.Game.Type
open import UG.SM.Time.time-to-tick
open import UG.SM.TimedAction.Type
open import UG.SM.Type
open import UG.SM.compute
open import UG.SM.new-mach
open import UG.SM.register-action

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
  let values = map to-nat bytes
  foldr (λ x acc -> x + (256 * acc)) 0 values 

nat-to-bytes : Nat -> List Word8
nat-to-bytes n = reverse (go n 6) 
  where
    go : Nat -> Nat -> List Word8
    go _ 0 = []
    go m (Succ k) = (from-nat m) :: (go (div m 256) k)

write-u48 : Nat -> ByteString
write-u48 n = pack (nat-to-bytes n)

click-event : Event
click-event = MouseClick LeftButton 0.0 0.0

decode : ByteString -> TimedAction Event
decode bs = record
  { action = click-event ; time = 1 }
  
-- FIXME not getting results correctly
handle-bs-result : ByteString -> (Mach State Event) -> IO (Mach State Event)
handle-bs-result bs mach = do
  let tag = head bs
  print ( "tag is: " ++ (bshow (cons tag (pack-string ""))))
  let rest = tail bs
  let room = read-u48 rest
  print ( "room is " ++ (show room))
  let rest2 = pack (take 6 (unpack rest))
  let time = read-u48 rest2
  print ( "time is " ++ (show time))
  let msg = pack (take 6 (unpack rest2))
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

  Video.init

  window <- Window.create 
  renderer <- Renderer.create window 

  loop initial-mach window renderer initialState (λ chan -> process-messages initial-mach chan) chan

  quit

