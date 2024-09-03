module HVM.Runtime.get where

open import HVM.Runtime.Type
open import HVM.State.Type
open import Data.Pair.Type

-- Gets the current state
get : Runtime State
get = λ state → state , state
