module HVM.Run.enter where

open import Base.Function.case
open import Base.Maybe.Maybe
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.subst-take
open import HVM.Term.Term

-- Recursively enters variables until reaching a
-- non-var term or a variable with no substitution
enter : ∀ {mode : Mode} → Term mode → Run mode (Term mode)
enter {WIRED} term = pure term
enter {NAMED} (Var x) = do
  subst ← subst-take x
  case subst of λ where
    None        → pure (Var x)
    (Some term) → enter term
enter {NAMED} term = pure term
