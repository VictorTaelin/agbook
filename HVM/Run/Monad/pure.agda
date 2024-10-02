module HVM.Run.Monad.pure where

open import HVM.Run.Run
open import HVM.Run.State.State
open import Base.Pair.Pair
open import HVM.Mode.Mode

pure : ∀ {mode : Mode} {A : Set} → A → Run mode A
pure x = λ state → (state , x)
