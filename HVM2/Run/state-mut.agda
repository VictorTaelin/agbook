module HVM2.Run.state-mut where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Modifies the current state using the given function
state-mut : (State → State) → Run Unit
state-mut f = λ state → (f state , unit)
