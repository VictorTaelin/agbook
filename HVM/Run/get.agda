module HVM.Run.get where

open import HVM.Run.Run
open import HVM.Run.State.State
open import Base.Pair.Pair
open import HVM.Mode.Mode

-- Gets the current state
get : ∀ {mode : Mode} → Run mode (State mode)
get = λ state → state , state
