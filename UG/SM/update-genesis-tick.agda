module UG.SM.update-genesis-tick where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import Base.Nat.Type
open import Base.Nat.min

-- mach: The machine state to update
-- new-tick: The new tick to compare with the current genesis tick
-- = An updated Mach with the genesis tick set to the minimum of new-tick and the current genesis tick
update-genesis-tick : ∀ {S A : Set} → Mach S A → Tick → Mach S A
update-genesis-tick mach new-tick = 
  record mach { genesis-tick = min new-tick (Mach.genesis-tick mach) }
