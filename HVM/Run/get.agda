module HVM.Run.get where

open import HVM.Run.Run
open import HVM.Run.State.State
open import Base.Pair.Pair

-- Gets the current state
get : Run State
get = λ state → state , state