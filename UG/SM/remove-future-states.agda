module UG.SM.remove-future-states where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import Data.Nat.Type
open import Data.Nat.add

-- Removes future states from the state logs
remove-future-states : ∀ {S A : Set} → Mach S A → Tick → Mach S A 
remove-future-states mach tick = 
  record mach { state-logs = remove-range (Mach.state-logs mach) (add tick 1) (Mach.cached-tick mach) }
