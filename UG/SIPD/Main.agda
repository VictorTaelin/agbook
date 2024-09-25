module UG.SIPD.Main where

import Concurrent.Channel.new as Channel
import Concurrent.Channel.read as Channel
import Concurrent.Channel.write as Channel
import UG.SIPD.Renderer.create as Renderer
import UG.SIPD.Video.init as Video
import UG.SIPD.Window.create as Window
import UG.Chat.Client.send as Client
import UG.Chat.Client.handle-message as Client
open import UG.Chat.Client.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.ByteString.Type
open import Base.ByteString.cons
open import Base.ByteString.drop
open import Base.ByteString.head
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import Base.ByteString.read-u48
open import Base.ByteString.show renaming (show to bshow)
open import Base.ByteString.tail
open import Base.ByteString.unpack
open import Base.F64.Type
open import Base.Function.case
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.Type
open import Base.IO.print
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
open import Base.List.length
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.gt
open import Base.Nat.add
open import Base.Nat.sub
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.show
open import Base.Pair.Type
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Result.Type
open import Base.String.Type
open import Base.String.append
open import Base.Time.now
open import Base.Unit.Type
open import Base.Word8.Type
open import Base.Word8.from-nat
open import Base.Word8.to-nat
open import Concurrent.Channel.Type
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-binary-data
open import Network.WebSocket.send-binary-data
open import Network.WebSocket.receive-data
open import Network.WebSocket.run-concurrent-client
open import UG.SIPD.Event.Click
open import UG.SIPD.Event.Type
open import UG.SIPD.Event.show-list
open import UG.SIPD.Event.get-events
open import UG.SIPD.Renderer.Type
open import UG.SIPD.State.Type
open import UG.SIPD.State.init
open import UG.SIPD.Video.quit
open import UG.SIPD.Window.Type
open import UG.SIPD.draw
open import UG.SM.Game.Type
open import UG.SM.Time.time-to-tick
open import UG.SM.TimedAction.Type
open import UG.SM.Type
open import UG.SM.compute
open import UG.SM.new-mach
open import UG.SM.register-action
open import UG.SM.ActionLogs.get-actions

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

handle-client-ev : WSConnection -> Maybe ByteString -> IO Unit
handle-client-ev conn maybe-bs with maybe-bs
... | Some bs = do
  send-binary-data conn bs
... | None    = do
  pure unit

handle-recv : Channel ByteString -> Maybe ByteString -> IO Unit
handle-recv chann maybe-bs with maybe-bs
... | Some bs = do
  Channel.write chann bs  
... | None = do
  pure unit

-- receive and update the client here. the problem is just the first client (i guess)
-- or just pass data and instantiate every single time
handle-ws : Channel ByteString -> Channel ByteString -> WSConnection -> IO Unit
handle-ws recv-channel client-channel connection = do
  client-ev <- Channel.read client-channel
  _ <- handle-client-ev connection client-ev

  msg <- receive-binary-data connection
  _ <- handle-recv recv-channel msg

  handle-ws recv-channel client-channel connection

click-event : Event
click-event = MouseClick LeftButton 0.0 0.0

decode : ByteString -> TimedAction Event
decode bs = record
  { action = click-event ; time = 1 }
  
handle-bs-result : ByteString -> (Mach State Event) -> IO (Mach State Event)
handle-bs-result bs mach = do
  let tag = head bs
  print ( "tag is: " ++ (bshow (cons tag (pack-string ""))))
  let room = read-u48 bs 1
  print ( "room is " ++ (show room))
  let time = read-u48 bs 7
  print ( "time is " ++ (show time))
  let msg = drop bs 13
  print ( "msg is " ++ (bshow msg))

  -- this will handle a bytestring result which should be decoded in an action
  let received-event = decode bs

  let new-sm = register-action mach received-event
  pure new-sm

process-messages : Mach State Event -> Channel ByteString -> Client -> IO (Pair (Mach State Event) Client)
process-messages mach channel client = do
  maybe-msg <- Channel.read channel
  case maybe-msg of λ where
    (Some msg) -> do
      new-mach <- handle-bs-result msg mach
      pure (new-mach , client)
    None -> do 
      pure (mach , client)

initial-mach : Mach State Event
initial-mach = new-mach 60 event-eq

time-action : Nat -> Event -> TimedAction Event
time-action time event = record { action = event ; time = time }

encode : Event -> ByteString
encode event = pack-string "hello"

register-events : Mach State Event -> List Event -> Channel ByteString -> IO (Mach State Event)
register-events mach events client-channel = do
  time <- now 
  let t = time
  let encoded-events = map encode events
  
  foldl (λ acc ev -> acc >>= λ _ -> Channel.write client-channel ev) (pure unit) encoded-events

  let timed-actions = map (time-action t) events
  let final-mach = foldl (λ acc-mach action -> register-action acc-mach action) mach timed-actions
  pure final-mach

loop : (Mach State Event) -> Window -> Renderer -> State -> (Channel ByteString -> Client -> IO (Pair (Mach State Event) Client)) -> Channel ByteString -> Channel ByteString -> Client -> IO State
loop mach window renderer state process-message channel client-channel client = do

  events <- get-events

  registered-mach <- register-events mach events client-channel

  time-now <- now

  (new-mach , new-client) <- process-message channel client

  -- let (newState , computed-mach) <- compute registered-mach game time-now
  let (newState , computed-mach) = (state , registered-mach)

  draw window renderer state
  loop computed-mach window renderer newState (λ chan client -> process-message chan client) channel client-channel client

main : IO Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"
  let client = record { server-time-offset = 0 ; best-ping = 1000000000 ; last-ping-time = 0 }

  chan <- Channel.new
  client-chan <- Channel.new

  print ("Connecting to WebSocket server")
  run-concurrent-client host port path (handle-ws chan client-chan)

  Video.init

  window <- Window.create 
  renderer <- Renderer.create window 

  loop initial-mach window renderer initialState (λ chan client -> process-messages initial-mach chan client) chan client-chan client

  quit

