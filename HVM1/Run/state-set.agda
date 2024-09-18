module HVM1.Run.state-set where

open import Base.Pair.Type
open import Base.Unit.Type
open import HVM1.Run.State.Type
open import HVM1.Run.Type

state-set : State → Run Unit
state-set new-state = λ _ → (new-state , unit)
