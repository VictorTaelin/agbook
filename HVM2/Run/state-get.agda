module HVM2.Run.state-get where

open import Data.Pair.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Gets the current state
state-get : Run State
state-get = λ state → (state , state)
