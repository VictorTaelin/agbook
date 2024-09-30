module HVM2.Run.link where

open import Debug.Trace
open import Base.String.append
import HVM2.Term.show as Term

open import Base.Function.case
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Unit.Unit
open import HVM2.Run.Run
open import HVM2.Run.Monad.bind
open import HVM2.Run.Monad.pure
open import HVM2.Run.redex-push
open import HVM2.Run.subst-swap
open import HVM2.Run.subst-take
open import HVM2.Term.Term

mutual
  -- Links two terms
  link : Term → Term → Run Unit
  link (Var x) b       = subst x b
  link a       (Var y) = subst y a
  link a       b       = redex-push a b

  -- Substitutes a variable with a term
  subst : String → Term → Run Unit
  subst x b = do
    old-val <- subst-swap x b
    case old-val of λ where
      None        → pure unit
      (Some term) → do
        subst-take x
        link term b
