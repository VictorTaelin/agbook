module UG.SM.new-mach where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import UG.SM.StateLogs.Type
open import UG.SM.ActionLogs.Type

open import Data.Nat.Type
open import Data.Map.new
open import Data.Bool.Type

-- Creates a new Mach (state machine) with the given ticks per second and action equality function.
-- - ticks_per_second: The number of ticks per second for this machine.
-- - action_eq: A function to compare two actions for equality.
-- = A new Mach instance with default values and the provided action equality function.
new_mach : ∀ {S A : Set} → Nat → (A → A → Bool) → Mach S A
new_mach ticks-per-second action_eq = record
  { ticks-per-second = ticks-per-second
  ; genesis-tick = 0  -- Representing the earliest possible tick
  ; cached-tick = 0   -- Representing no cached tick
  ; state-logs = new
  ; action-logs = new
  ; action-eq = action_eq
  }
