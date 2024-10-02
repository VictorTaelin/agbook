module HVM.Run.materialize where

open import Base.Function.case
open import HVM.Run.Run
open import HVM.Run.Monad.bind
open import HVM.Run.enter
open import HVM.Run.Monad.pure
open import HVM.Term.Term
open import HVM.Mode.Mode
open import HVM.Addr.Addr

-- Recursively materializes a term by resolving variables
-- In WIRED mode, it returns the term as is
-- In NAMED mode, it resolves variables recursively
materialize : ∀ {mode : Mode} → Term mode → Run mode (Term mode)
materialize {WIRED} term = pure term
materialize {NAMED} term = do
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
