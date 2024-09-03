module UG.SM.compute where

open import UG.SM.Type
open import UG.SM.Game.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import UG.SM.ActionLogs.Type
open import UG.SM.ActionLogs.get-actions
open import UG.SM.Time.Type
open import UG.SM.Time.time-to-tick
open import UG.SM.update-mach
open import UG.SM.get-initial-state

open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.max
open import Data.Nat.lt
open import Data.Function.case using (case_of_)
open import Data.List.Type
open import Data.List.fold
open import Data.Maybe.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Nat.to-bits
open import Data.Nat.sub
open import Data.Nat.gt

-- mach: The state machine
-- game: The game rules
-- state: The current state
-- current-tick: The current tick
-- end-tick: The target tick
-- = The computed state at the end tick
compute-helper : ∀ {S A : Set} → Mach S A → Game S A → S → Tick → Tick → S
compute-helper mach game state current-tick end-tick =
  if current-tick == end-tick
  then state
  else 
    let next-tick = Succ current-tick
        actions = get-actions (Mach.action-logs mach) current-tick
        state-with-actions = fold (Game.when game) state actions
        next-state = Game.tick game state-with-actions
        updated-mach = update-mach mach current-tick state
    in compute-helper updated-mach game next-state next-tick end-tick

-- Computes the state of the game at a given time
-- mach: The state machine
-- game: The game rules
-- time: The target time
-- = The computed state at the given time
compute : ∀ {S A : Set} → Mach S A → Game S A → Time → S
compute mach game time =
  let ini-t = Mach.cached-tick mach
      end-t = time-to-tick mach time
      initial-state = get-initial-state mach game ini-t
  in
  if (end-t - ini-t) > 1000
  then initial-state
  else compute-helper mach game initial-state ini-t end-t
