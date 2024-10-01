module UG.SM.new-mach where

open import Base.BitMap.new
open import Base.Bool.Bool
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import UG.SM.ActionLogs.ActionLogs
open import UG.SM.SM
open import UG.SM.StateLogs.StateLogs
open import UG.SM.Tick.Tick

-- Creates a new Mach (state machine) with the given ticks per second and action equality function.
-- - ticks_per_second: The number of ticks per second for this machine.
-- - action_eq: A function to compare two actions for equality.
-- = A new Mach instance with default values and the provided action equality function.
new-mach : ∀ {S A : Set} → Nat → (A → A → Bool) → Mach S A
new-mach ticks-per-second action_eq = record
  { ticks-per-second = ticks-per-second
  ; genesis-tick = 10000000000000000000000000000000  -- Representing the earliest possible tick
  ; cached-tick = 0   -- Representing no cached tick
  ; state-logs = None
  ; action-logs = new
  ; action-eq = action_eq
  }

