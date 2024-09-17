module HVM2.Run.enter where

open import Data.Function.case
open import Data.Maybe.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.pure
open import HVM2.Run.subst-take
open import HVM2.Term.Type

-- Recursively enters variables until reaching a
-- non-var term or a variable with no substitution
enter : Term → Run Term
enter (Var x) = do
  subst ← subst-take x
  case subst of λ where
    None        → pure (Var x)
    (Some term) → enter term
enter term = pure term
