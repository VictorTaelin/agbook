module HVM2.Run.mut-state where

open import Data.Pair.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.State.Type

-- Modifies the current state using the given function
mut-state : (State → State) → Run Unit
mut-state f = λ state → (f state , unit)
