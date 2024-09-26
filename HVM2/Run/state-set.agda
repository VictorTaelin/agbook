module HVM2.Run.state-set where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Run.State.State

-- Sets the current state
state-set : State -> Run Unit
state-set new-state = λ _ -> (new-state , unit)
