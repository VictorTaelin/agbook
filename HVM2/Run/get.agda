module HVM2.Run.get where

open import HVM2.Run.Run
open import HVM2.Run.State.State
open import Base.Pair.Pair

-- Gets the current state
get : Run State
get = λ state → state , state
