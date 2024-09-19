module HVM2.Run.materialize where

open import Base.Function.case
open import HVM2.Run.Type
open import HVM2.Run.Monad.bind
open import HVM2.Run.enter
open import HVM2.Run.Monad.pure
open import HVM2.Term.Type

-- Recursively materializes a term by resolving variables
-- - term: The term to materialize
-- = A Run Term representing the materialized structure
materialize : Term → Run Term
materialize term = do
  resolved ← enter term
  case resolved of λ where
    (Var x)     → pure (Var x)
    Era         → pure Era
    (Con p1 p2) → do
      m1 ← materialize p1
      m2 ← materialize p2
      pure (Con m1 m2)
    (Dup p1 p2) → do
      m1 ← materialize p1
      m2 ← materialize p2
      pure (Dup m1 m2)
