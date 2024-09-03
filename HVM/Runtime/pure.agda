module HVM.Runtime.pure where

open import HVM.Runtime.Type
open import HVM.State.Type
open import Data.Pair.Type

-- Creates a Runtime computation that always succeeds with the given value without modifying the state
pure : ∀ {A : Set} → A → Runtime A
pure x = λ state → (state , x)
