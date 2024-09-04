module HVM.Runtime.materialize where

open import Data.Function.case
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.enter
open import HVM.Runtime.pure
open import HVM.Term.Type

-- Recursively materializes a term by resolving variables
-- - term: The term to materialize
-- = A Runtime Term representing the materialized structure
materialize : Term → Runtime Term
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
