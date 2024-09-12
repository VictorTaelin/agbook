module HVM.Runtime.bind where

open import Data.Pair.Type
open import HVM.Runtime.Type
open import HVM.State.Type

-- Monadic bind for Runtime type
bind : ∀ {A B : Set} → Runtime A → (A → Runtime B) → Runtime B
bind ma fn state = do
  let (state , a) = ma state
  let (state , b) = fn a state
  (state , b)

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Runtime A → (A → Runtime B) → Runtime B
_>>=_ = bind

-- Sequencing operator, discards the result of the first computation
_>>_ : ∀ {A B : Set} → Runtime A → Runtime B → Runtime B
ma >> mb = bind ma (λ _ → mb)

infixl 1 _>>=_ _>>_
