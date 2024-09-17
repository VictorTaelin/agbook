module HVM2.Run.get-state where

open import Data.Pair.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Gets the current state
get-state : Run State
get-state = λ state → (state , state)
