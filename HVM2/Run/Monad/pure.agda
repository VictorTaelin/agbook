module HVM2.Run.Monad.pure where

open import HVM2.Run.Run
open import HVM2.Run.State.State
open import Base.Pair.Pair

-- Creates a Run computation that always succeeds with the given value without modifying the state
pure : ∀ {A : Set} → A → Run A
pure x = λ state → (state , x)
