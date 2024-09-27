module UG.SM.update-cached-tick where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Nat.lt
open import UG.SM.SM
open import UG.SM.Tick.Tick

-- mach: The machine state to update.
-- new-tick: The new tick value to potentially update the cached tick with.
-- = Returns an updated Mach S A with potentially modified cached-tick.
update-cached-tick : ∀ {S A : Set} -> Mach S A -> Tick -> Mach S A
update-cached-tick mach new-tick with new-tick < Mach.cached-tick mach
... | True = record mach { cached-tick = new-tick }
... | False = record mach { cached-tick = Mach.cached-tick mach }
