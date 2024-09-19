module HVM2.Run.state-set where

open import Base.Pair.Type
open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Sets the current state
state-set : State → Run Unit
state-set new-state = λ _ → (new-state , unit)
