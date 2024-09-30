module UG.SM.update-genesis-tick where

open import Base.Nat.Nat
open import Base.Nat.min
open import Base.Nat.lt
open import Base.Bool.if
open import UG.SM.SM
open import UG.SM.Tick.Tick

-- mach: The machine state to update.
-- new-tick: The new tick to compare with the current genesis tick.
-- = An updated Mach with the genesis tick set to the minimum of new-tick and the current genesis tick.
update-genesis-tick : ∀ {S A : Set} → Mach S A → Tick → Mach S A
update-genesis-tick mach new-tick = do
  let new-genesis = min new-tick (Mach.genesis-tick mach) 
  record mach { genesis-tick = new-genesis }

