module HVM.Run.Monad.pure where

open import HVM.Run.Run
open import HVM.Run.State.State
open import Base.Pair.Pair

pure : {A : Set} → A → Run A
pure x = λ state → (state , x)

