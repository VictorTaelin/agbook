module UG.SM.Main where

open import UG.SM.Type
open import UG.SM.Game.Type
open import UG.SM.new-mach
open import UG.SM.register-action
open import UG.SM.compute
open import UG.SM.Time.Type
open import UG.SM.TimedAction.Type
open import UG.SM.Time.time-to-tick

open import Data.Nat.Type
open import Data.Nat.show
open import Data.Bool.Type
open import Data.String.Type
open import Data.IO.seq
open import Data.String.append
open import Data.IO.Type
open import Data.IO.print
open import Data.Unit.Type
open import Data.Maybe.Type
open import Data.List.Type

open import Data.Map.Type
open import Data.Map.new
open import Data.Map.set
open import Data.Map.count
open import Data.Bits.Type

-- Simple game state
data GameState : Set where
  Score : Nat → GameState

-- Simple game action
data GameAction : Set where
  AddPoint : GameAction

-- Game definition
game : Game GameState GameAction
game = record
  { init = Score 0
  ; when = λ { AddPoint (Score n) → Score (Succ n) }
  ; tick = λ { (Score n) → Score (Succ n) }  -- Increment score on each tick
  }

-- Action equality function
action-eq : GameAction → GameAction → Bool
action-eq AddPoint AddPoint = False

gameStateToString : GameState → String
gameStateToString (Score n) = "Score " ++ show n

-- Debug log function
debug-log : String → IO Unit
debug-log = print

-- Test function
test : IO Unit
test = do
  debug-log "Starting test..."
  
  let initial-mach = new-mach 1000 action-eq
  debug-log ("Initial machine created with " ++ show (Mach.ticks-per-second initial-mach) ++ " ticks per second")
  debug-log ("Initial machine logs: " ++ show (count (Mach.action-logs initial-mach)))
  
  let mach1 = register-action initial-mach (record { action = AddPoint ; time = 5 })
  debug-log "Registered AddPoint action at time 5"
  debug-log ("Action logs count after first action: " ++ show (count (Mach.action-logs mach1)))
  
  let mach2 = register-action mach1 (record { action = AddPoint ; time = 15 })
  debug-log "Registered AddPoint action at time 15"
  debug-log ("Action logs count after second action: " ++ show (count (Mach.action-logs mach2)))
 
  -- Compute calls
  let state0 = compute mach2 game 0
  debug-log ("State at time 0: " ++ gameStateToString state0)
  
  let state5 = compute mach2 game 5
  debug-log ("State at time 5: " ++ gameStateToString state5)
  
  let state10 = compute mach2 game 10
  debug-log ("State at time 10: " ++ gameStateToString state10)
  
  let state15 = compute mach2 game 15
  debug-log ("State at time 15: " ++ gameStateToString state15)
  
  let state20 = compute mach2 game 20
  debug-log ("State at time 20: " ++ gameStateToString state20)

  debug-log "Test completed."

-- Main function
main : IO Unit
main = do
  test
