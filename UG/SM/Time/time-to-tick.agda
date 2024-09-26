module UG.SM.Time.time-to-tick where

open import UG.SM.SM
open import UG.SM.Time.Time
open import UG.SM.Tick.Tick

open import Base.Nat.Nat
open import Base.Nat.div
open import Base.Nat.mul

-- Converts a Time value to a Tick value for a given state machine.
-- - mach: The state machine.
-- - time: The time to convert.
-- = The corresponding Tick value.
time-to-tick : ∀ {S A : Set} -> Mach S A -> Time -> Tick
time-to-tick mach time = 
  div (mul time (Mach.ticks-per-second mach)) 1000
