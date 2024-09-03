module HVM.Runtime.modify where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Modifies the current state using the given function
modify : (State → State) → Runtime Unit
modify f = λ state → (f state , unit)
