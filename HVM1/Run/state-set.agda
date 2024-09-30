module HVM1.Run.state-set where

open import Base.Pair.Pair
open import Base.Unit.Unit
open import HVM1.Run.State.State
open import HVM1.Run.Run

state-set : State → Run Unit
state-set new-state = λ _ → (new-state , unit)
