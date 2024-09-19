module HVM1.Run.Monad.pure where

open import HVM1.Run.Type
open import HVM1.Run.State.Type
open import Base.Pair.Type

-- Creates a Run computation that always succeeds with the given value without modifying the state
pure : ∀ {A : Set} → A → Run A
pure x = λ state → (state , x)
