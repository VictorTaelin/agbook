module HVM.Runtime.get-state where

open import Data.Pair.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Gets the current state
get-state : Runtime State
get-state = λ state → (state , state)
