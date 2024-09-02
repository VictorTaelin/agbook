module UG.SM.update-cached-tick where

open import UG.SM.Type
open import UG.SM.Tick.Type

open import Data.Nat.lt
open import Data.Bool.if

-- Updates the cached tick
update-cached-tick : ∀ {S A : Set} → Mach S A → Tick → Mach S A
update-cached-tick mach new-tick = 
  record mach { cached-tick = if new-tick < Mach.cached-tick mach 
                              then new-tick 
                              else Mach.cached-tick mach }
