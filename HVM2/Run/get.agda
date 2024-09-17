module HVM2.Run.get where

open import HVM2.Run.Type
open import HVM2.Run.State.Type
open import Data.Pair.Type

-- Gets the current state
get : Run State
get = λ state → state , state
