module UG.SM.update-genesis-tick where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import Data.Nat.Type
open import Data.Nat.min

-- Updates the genesis tick
update-genesis-tick : ∀ {S A : Set} → Mach S A → Tick → Mach S A
update-genesis-tick mach new-tick = 
  record mach { genesis-tick = min new-tick (Mach.genesis-tick mach) }
