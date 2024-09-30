module UG.SIPD.Main where

import Concurrent.Channel.new as Channel
import Concurrent.Channel.read as Channel
import Concurrent.Channel.write as Channel
import UG.SIPD.Event.deserialize as Event
import UG.SIPD.Event.serialize as Event
import UG.SIPD.Event.show as Event
import UG.SIPD.Renderer.create as Renderer
import UG.SIPD.Video.init as Video
import UG.SIPD.Window.create as Window
import UG.Chat.Client.send as Client
import UG.Chat.Client.join-room as Client
import UG.Chat.Client.sync-time as Client
import UG.Chat.Client.handle-pong as Client
import UG.Chat.Message.to-nat as Message
open import UG.Chat.Client.Client
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.ByteString.ByteString
open import Base.ByteString.cons
open import Base.ByteString.drop
open import Base.ByteString.head
open import Base.ByteString.pack
open import Base.ByteString.pack-string
open import Base.ByteString.read-u48
open import Base.ByteString.show renaming (show to bshow)
open import Base.ByteString.tail
open import Base.ByteString.unpack
open import Base.F64.F64
open import Base.Function.case
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import Base.IO.IO
open import Base.IO.print
open import Base.Int.Int
open import Base.List.List
import Base.List.head as List
open import Base.List.foldl
open import Base.List.foldr
open import Base.List.map
open import Base.List.reverse
open import Base.List.take
open import Base.List.length
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.gt
open import Base.Nat.add
open import Base.Nat.sub
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.show
open import Base.Pair.Pair
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Result.Result
open import Base.String.String
open import Base.String.append
open import Base.Time.now
open import Base.Unit.Unit
open import Base.Word8.Word8
open import Base.Word8.from-nat
open import Base.Word8.to-nat
open import Concurrent.Channel.Channel
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-binary-data
open import Network.WebSocket.send-binary-data
open import Network.WebSocket.receive-data
open import Network.WebSocket.run-concurrent-client
open import UG.SIPD.Event.Click.Click
open import UG.SIPD.Event.Event
open import UG.SIPD.Event.get-events
open import UG.SIPD.Renderer.Renderer
open import UG.SIPD.State.State
open import UG.SIPD.State.init
open import UG.SIPD.Video.quit
open import UG.SIPD.Window.Window
open import UG.SIPD.draw
open import UG.SM.Game.Game
open import UG.SM.Time.time-to-tick
open import UG.SM.TimedAction.TimedAction
open import UG.SM.SM
open import UG.SM.compute
open import UG.SM.new-mach
open import UG.SM.register-action
open import UG.SM.ActionLogs.get-actions

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

handle-client-ev : WSConnection → Maybe ByteString → IO Unit
handle-client-ev conn maybe-bs with maybe-bs
... | Some bs = do
  let complete-data = Client.send 1 bs
  send-binary-data conn complete-data
... | None    = do
  pure unit

handle-recv : Channel ByteString → Maybe ByteString → IO Unit
handle-recv chann maybe-bs with maybe-bs
... | Some bs = do
  Channel.write chann bs  
... | None = do
  pure unit


handle-ws : Channel ByteString → Channel ByteString → Client → Bool → WSConnection → IO Unit
handle-ws recv-channel client-channel client join connection with join
... | True = do
  (new-client , sync-msg) <- Client.sync-time client
  send-binary-data connection sync-msg
  send-binary-data connection (Client.join-room 1)
  handle-ws recv-channel client-channel new-client False connection
... | False = do
  client-ev <- Channel.read client-channel
  _ <- handle-client-ev connection client-ev
  msg <- receive-binary-data connection
  _ <- handle-recv recv-channel msg
  handle-ws recv-channel client-channel client False connection

click-event : Event
click-event = MouseClick LeftButton 0.0 0.0

time-action : Nat → Event → TimedAction Event
time-action time event = record { action = event ; time = time }

register-event : Maybe Event → Nat → Mach State Event → Mach State Event
register-event maybe-event time mach with maybe-event
... | Some event = do
  let timed-action = time-action time event
  register-action mach timed-action
... | None = mach

show-ev : Maybe Event → IO Unit
show-ev maybe-ev with maybe-ev
... | Some event = do
  print ( Event.show event )
... | None = print ("failed")

handle-bs-result : ByteString → (Mach State Event) → Client → IO (Pair (Mach State Event) Client)
handle-bs-result bs mach client with to-nat (head bs)
... | 3 = do -- DATA
  let room = read-u48 bs 1
  print ("ROOM: " ++ show room)
  time-now <- now
  print ("NOW: " ++ show time-now)
  let time = read-u48 bs 7
  print ("TIME: " ++ show time)
  let msg = drop bs 13
  let event = Event.deserialize msg
  print ("SM GEN: " ++ (show (Mach.genesis-tick mach)))
  print ("SM CACH: " ++ (show (Mach.cached-tick mach)))
  show-ev event
  let new-sm = register-event event time mach
  print ("SM GEN: " ++ (show (Mach.genesis-tick new-sm)))
  print ("SM CACH: " ++ (show (Mach.cached-tick new-sm)))
  pure (new-sm , client)
... | 6 = do
  new-client <- Client.handle-pong client bs
  pure (mach , new-client)
... | _ = do
  pure (mach , client)
  
process-messages : Mach State Event → Channel ByteString → Client → IO (Pair (Mach State Event) Client)
process-messages mach channel client = do
  maybe-msg <- Channel.read channel
  case maybe-msg of λ where
    (Some msg) → do
      (new-mach , new-client) <- handle-bs-result msg mach client
      pure (new-mach , new-client)
    None → do 
      pure (mach , client)

initial-mach : Mach State Event
initial-mach = new-mach 60 event-eq

create-valid-events : List (Maybe ByteString) → List ByteString
create-valid-events [] = []
create-valid-events (x :: xs) with x
... | Some bs = bs :: create-valid-events xs
... | None    = create-valid-events xs

register-events : Mach State Event → List Event → Channel ByteString → IO (Mach State Event)
register-events mach events client-channel = do
  time <- now 
  let encoded-events = map Event.serialize events
  let valid-events = create-valid-events encoded-events
  
  foldl (λ acc ev → acc >>= λ _ → Channel.write client-channel ev) (pure unit) valid-events

  --let timed-actions = map (time-action time) events
  --let final-mach = foldl (λ acc-mach action → register-action acc-mach action) mach timed-actions
  --pure final-mach
  pure mach

loop : (Mach State Event) → Window → Renderer → State → (Mach State Event → Channel ByteString → Client → IO (Pair (Mach State Event) Client)) → Channel ByteString → Channel ByteString → Client → IO State
loop mach window renderer state process-message channel client-channel client = do

  events <- get-events

  reg-mach <- register-events mach events client-channel

  time-now <- now
  
  (proc-mach , client) <- process-message reg-mach channel client
  (newState , computed-mach) <- compute proc-mach game time-now

  draw window renderer newState

  loop computed-mach window renderer newState (λ mach chan client → process-message mach chan client) channel client-channel client

main : IO Unit
main = do
-- ws://server.uwu.games
  let host = "127.0.0.1"
  let port = (Pos 7171)
  let path = "/"
--  let host = "server.uwu.games"
--  let port = (Pos 7171)
--  let path = "/"
  let client = record { server-time-offset = 0 ; best-ping = 1000000000 ; last-ping-time = 0 }

  chan <- Channel.new
  client-chan <- Channel.new

  run-concurrent-client host port path (handle-ws chan client-chan client True)

  Video.init

  window <- Window.create 
  renderer <- Renderer.create window 
  
  t <- now
  let join = time-action t click-event
  let ini-mach = register-action initial-mach join

  loop ini-mach window renderer initialState (λ mach chan client → process-messages mach chan client) chan client-chan client

  quit

