module HVM.Run.Monad.bind where

open import Base.Pair.Pair
open import HVM.Run.Run
open import HVM.Run.State.State

bind : ∀ {A B : Set} → Run A → (A → Run B) → Run B
bind ma fn state = do
  let (state' , a) = ma state
  fn a state'

seq : ∀ {A B : Set} → Run A → Run B → Run B
seq p q = bind p (λ _ → q)

_>>=_ : ∀ {A B : Set} → Run A → (A → Run B) → Run B
_>>=_ = bind

_>>_ : ∀ {A B : Set} → Run A → Run B → Run B
_>>_ = seq

infixl 1 _>>=_ _>>_
