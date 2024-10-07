module HVM.Run.enter where

open import Base.Function.case
open import Base.Maybe.Maybe
open import HVM.Run.Run
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.subst-take
open import HVM.Term.Term

-- Recursively enters variables until reaching a
-- non-var term or a variable with no substitution
{-# TERMINATING #-}
enter : Term → Run Term
enter (Var x addr) = do
  subst ← subst-take x
  case subst of λ where
    None        → pure (Var x addr)
    (Some term) → enter term
enter term = pure term
