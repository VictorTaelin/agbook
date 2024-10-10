module HVM.Run.state-get where

open import Base.Pair.Pair
open import HVM.Run.Run
open import HVM.Run.State.State

-- Gets the current state
state-get : Run State
state-get = λ state → (state , state)

