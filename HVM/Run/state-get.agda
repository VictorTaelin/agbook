module HVM.Run.state-get where

open import Base.Pair.Pair
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.State.State

-- Gets the current state
state-get : ∀ {mode : Mode} → Run mode (State mode)
state-get = λ state → (state , state)
