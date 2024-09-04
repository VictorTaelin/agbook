module HVM.Runtime.enter where

open import Data.Function.case
open import Data.Maybe.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.pure
open import HVM.Runtime.take-subst
open import HVM.Term.Type

-- Recursively enters variables until reaching a
-- non-var term or a variable with no substitution
enter : Term → Runtime Term
enter (Var x) = do
  subst ← take-subst x
  case subst of λ where
    None        → pure (Var x)
    (Some term) → enter term
enter term = pure term
