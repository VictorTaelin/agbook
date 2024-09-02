module UG.SM.update-genesis-tick where

open import UG.SM.Type
open import UG.SM.Tick.Type
open import Data.Nat.Type
open import Data.Nat.lt
open import Data.Bool.if

-- Updates the genesis tick
update-genesis-tick : ∀ {S A : Set} → Mach S A → Tick → Mach S A
update-genesis-tick mach new-tick = 
  record mach { genesis-tick = if new-tick < Mach.genesis-tick mach 
                               then new-tick 
                               else Mach.genesis-tick mach }
