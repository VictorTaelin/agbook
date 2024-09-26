module UG.SM.update-cached-tick where

open import UG.SM.SM
open import UG.SM.Tick.Tick

open import Base.Bool.if
open import Base.Nat.lt

-- mach: The machine state to update
-- new-tick: The new tick value to potentially update the cached tick with
-- = Returns an updated Mach S A with potentially modified cached-tick
update-cached-tick : ∀ {S A : Set} -> Mach S A -> Tick -> Mach S A
update-cached-tick mach new-tick = 
  record mach { cached-tick = if new-tick < Mach.cached-tick mach 
                              then new-tick 
                              else Mach.cached-tick mach }
