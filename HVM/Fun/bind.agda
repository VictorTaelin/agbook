module HVM.Fun.bind where

open import Data.Pair.Type
open import HVM.Env.Type
open import HVM.Fun.Type

-- Monadic bind for Fun type
-- - ma: The first computation
-- - fn: A function that takes the result of ma and returns a new computation
-- = A new computation that combines ma and f
bind : ∀ {A B : Set} → Fun A → (A → Fun B) → Fun B
bind ma fn env = 
  let (env , a) = ma env
      (env , b) = fn a env
  in (env , b)

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Fun A → (A → Fun B) → Fun B
_>>=_ = bind

-- Sequencing operator, discards the result of the first computation
_>>_ : ∀ {A B : Set} → Fun A → Fun B → Fun B
ma >> mb = bind ma (λ _ → mb)

infixl 1 _>>=_ _>>_
