module HVM1.Run.bind where

open import Base.Pair.Type
open import HVM1.Run.Type
open import HVM1.Run.State.Type

-- Monadic bind for Run type
bind : ∀ {A B : Set} → Run A → (A → Run B) → Run B
bind ma fn state = do
  let (state , a) = ma state
  let (state , b) = fn a state
  (state , b)

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Run A → (A → Run B) → Run B
_>>=_ = bind

-- Sequencing operator, discards the result of the first computation
_>>_ : ∀ {A B : Set} → Run A → Run B → Run B
ma >> mb = bind ma (λ _ → mb)

infixl 1 _>>=_ _>>_
