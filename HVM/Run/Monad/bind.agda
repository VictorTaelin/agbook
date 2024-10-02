module HVM.Run.Monad.bind where

open import Base.Pair.Pair
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.State.State

bind : ∀ {mode : Mode} {A B : Set} → Run mode A → (A → Run mode B) → Run mode B
bind ma fn state = do
  let (state' , a) = ma state
  fn a state'

seq : ∀ {mode : Mode} {A B : Set} → Run mode A → Run mode B → Run mode B
seq p q = bind p (λ _ → q)

_>>=_ :  ∀ {mode : Mode} {A B : Set} → Run mode A → (A → Run mode B) → Run mode B
_>>=_ = bind

_>>_ : ∀ {mode : Mode} {A B : Set} → Run mode A → Run mode B → Run mode B
_>>_ = seq

infixl 1 _>>=_ _>>_
