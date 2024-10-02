module HVM.Run.state-set where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.State.State

-- Sets the current state
state-set : ∀ {mode : Mode} → State mode → Run mode Unit
state-set new-state = λ _ → (new-state , unit)
