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

-- Define the update function
when : State → State
when (MkState count) = MkState (Succ count)

handleEvent : Event → (State → State) → State → State
handleEvent (MouseClick LeftButton _ _) when game = when game
handleEvent _ _ game = game

-- Main function that runs the game
main : IO Unit
main = play window background fps initialState when handleEvent



