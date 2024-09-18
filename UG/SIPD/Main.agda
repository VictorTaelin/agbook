module UG.SIPD.Main where

open import Data.IOAsync.Type
open import Data.IOAsync.bind
open import Data.IOAsync.seq
open import Data.IOAsync.print
open import Data.IOAsync.pure
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

-- now to integrate with websocket, we just need to:
-- receive the runClientWithHandler or similar in the gameLoop
-- have a function that correctly processes the incoming messages (this goes along with the State Machine process)
-- adjust the game loop to run the process function every tick

handle-websocket : Channel String → WSConnection → IOAsync Unit
handle-websocket channel connection = do
  msg <- receive-data connection
  write-channel channel msg
  handle-websocket channel connection


handle-json-result : Result (Reply JSON) Error → IOAsync Unit
handle-json-result (Done reply) = print ("Received and parsed JSON: " ++ jshow (Reply.value reply))
handle-json-result (Fail error) = print ("Failed to parse JSON")


process-messages : Channel String → IOAsync Unit
process-messages channel = do
  maybe-msg <- read-channel channel
  case maybe-msg of λ where
    (Some msg) → do
      let parse-result = parse-json-string msg
      handle-json-result parse-result
    None → pure unit
--  process-messages channel
  
main : IOAsync Unit
main = do
  let host = "127.0.0.1"
  let port = (Pos 8080)
  let path = "/"

  chan <- new-channel

  print ("Connecting to WebSocket server")
  run-concurrent-client host port path (handle-websocket chan)

  gameLoop game (process-messages) chan



