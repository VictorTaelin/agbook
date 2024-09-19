module UG.SIPD.Main where

open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.seq
open import Data.IO.print
open import Data.IO.pure
open import Data.Unit.Type
open import Data.String.Type
open import Data.String.append
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Int.Type
open import Data.Float.Type
open import Data.Pair.Type
open import UG.SIPD.FFI.Gloss
open import UG.SIPD.State.Type
open import UG.SIPD.State.init
open import UG.SM.Game.Type
open import UG.SM.Type
open import Data.Bool.Type
open import Concurrent.Channel.Type
open import Concurrent.Channel.write-channel
open import Concurrent.Channel.new-channel
open import Concurrent.Channel.read-channel
open import Network.WebSocket.WSConnection
open import Network.WebSocket.receive-data
open import Network.WebSocket.run-concurrent-client
open import Data.Result.Type
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.JSON.Type
open import Data.JSON.parse
open import Data.JSON.show renaming (show to jshow)
open import Data.Maybe.Type
open import Data.Function.case
open import UG.SM.new-mach
open import UG.SM.register-action
open import Data.List.foldl
open import UG.SIPD.FFI.quit-video

-- Define the window size and title
window : Window
window = "Click Counter" , (800 , 600)

-- Define the background color
background : String
background = "white"

-- Define the frames per second
fps : Nat
fps = 60

-- Define the initial click count
initialState : State
initialState = init

-- for now just dont check duplicates since we dont have the time element
event-eq : Event → Event → Bool
event-eq _ _ = False

-- Define the update function for a single event
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

handle-websocket : Channel String → WSConnection → IO Unit
handle-websocket channel connection = do
  msg <- receive-data connection
  write-channel channel msg
  handle-websocket channel connection


handle-json-result : Result (Reply JSON) Error → IO Unit
handle-json-result (Done reply) = print ("Received and parsed JSON: " ++ jshow (Reply.value reply))
handle-json-result (Fail error) = print ("Failed to parse JSON")


process-messages : Channel String → IO Unit
process-messages channel = do
  maybe-msg <- read-channel channel
  case maybe-msg of λ where
    (Some msg) → do
      let parse-result = parse-json-string msg
      handle-json-result parse-result
    None → pure unit


initial-mach : Mach State Event
initial-mach = new-mach 60 event-eq


loop : (Mach State Event) -> SDLWindow -> Renderer -> State -> (Channel String -> IO Unit) -> Channel String -> IO State
loop mach window renderer state process-message channel = do

  process-message channel

  events <- get-events

  -- let updatedMach = foldr register-action mach events
  -- TODO: use state machine here
  let newState = foldl (λ state event → Game.when game event state) state events

  --let newState = foldl (Game.when game) state events

  draw window renderer newState
  loop mach window renderer newState process-message channel

  
main : IO Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"

  chan <- new-channel

  print ("Connecting to WebSocket server")
  run-concurrent-client host port path (handle-websocket chan)

  init-video

  window <- create-window 
  renderer <- create-renderer window

  loop initial-mach window renderer initialState (process-messages) chan

  quit-video

