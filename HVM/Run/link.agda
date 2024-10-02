module HVM.Run.link where

open import Base.Function.case
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM.Mode.Mode
open import HVM.Run.Run
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.redex-push
open import HVM.Run.subst-swap
open import HVM.Run.subst-take
open import HVM.Term.Term
open import HVM.Addr.Addr

-- TODO: implement WIRED mode link
wired-link : Term WIRED → Term WIRED → Run WIRED Unit
wired-link _ _ = pure unit

-- NAMED mode link
mutual
  named-link : Term NAMED → Term NAMED → Run NAMED Unit
  named-link (Var x) b       = subst x b
  named-link a       (Var y) = subst y a
  named-link a       b       = redex-push a b

  subst : String → Term NAMED → Run NAMED Unit
  subst x b = do
    old-val ← subst-swap x b
    case old-val of λ where
      None → pure unit
      (Some term) → do
        _ ← subst-take x
        named-link term b

-- Links two terms
link : ∀ {mode : Mode} → Term mode → Term mode → Run mode Unit
link {WIRED} a b = wired-link a b
link {NAMED} a b = named-link a b
