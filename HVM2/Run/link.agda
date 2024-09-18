module HVM2.Run.link where

open import Debug.Trace
open import Base.String.append
import Base.Bits.show as Bits
import HVM2.Term.show as Term

open import Base.Bits.Type
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.pure
open import HVM2.Run.redex-push
open import HVM2.Run.subst-swap
open import HVM2.Run.subst-take
open import HVM2.Term.Type

mutual
  -- Links two terms
  link : Term → Term → Run Unit
  link a b = trace ("link " ++ Term.show a ++ " ~ " ++ Term.show b) (link' a b) where
    link' : Term -> Term -> Run Unit
    link' (Var x) b       = subst x b
    link' a       (Var y) = subst y a
    link' a       b       = redex-push a b

  -- Substitutes a variable with a term
  subst : Bits → Term → Run Unit
  subst x b = do
    old-val ← subst-swap x b
    case old-val of λ where
      None        → pure unit
      (Some term) → do
        subst-take x
        link term b
