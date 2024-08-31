module HVM.Fun.bind where

open import Data.Pair.Type
open import HVM.Env.Type
open import HVM.Fun.Type

-- Monadic bind for Fun type
-- - ma: The first computation
-- - fn: A function that takes the result of ma and returns a new computation
-- = A new computation that combines ma and f
bind : ∀ {A B : Set} → Fun A → (A → Fun B) → Fun B
bind ma fn env = do
  let (env , a) = ma env
  let (env , b) = fn a env
  (env , b)

-- Infix operator for bind
_>>=_ : ∀ {A B : Set} → Fun A → (A → Fun B) → Fun B
_>>=_ = bind

infixl 1 _>>=_
