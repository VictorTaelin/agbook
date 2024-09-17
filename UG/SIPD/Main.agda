module UG.SIPD.Main where

open import Data.IO.Type
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

main : IO Unit
main = gameLoop game



