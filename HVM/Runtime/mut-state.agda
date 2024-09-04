module HVM.Runtime.mut-state where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Modifies the current state using the given function
mut-state : (State → State) → Runtime Unit
mut-state f = λ state → (f state , unit)
