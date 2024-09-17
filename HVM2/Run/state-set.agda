module HVM2.Run.state-set where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Sets the current state
state-set : State → Run Unit
state-set new-state = λ _ → (new-state , unit)
