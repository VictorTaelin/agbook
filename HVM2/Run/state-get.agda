module HVM2.Run.state-get where

open import Base.Pair.Pair
open import HVM2.Run.Run
open import HVM2.Run.State.State

-- Gets the current state
state-get : Run State
state-get = λ state → (state , state)
