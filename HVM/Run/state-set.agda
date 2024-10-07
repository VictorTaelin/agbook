module HVM.Run.state-set where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM.Run.Run
open import HVM.Run.State.State

-- Sets the current state
state-set : State → Run Unit
state-set new-state = λ _ → (new-state , unit)
