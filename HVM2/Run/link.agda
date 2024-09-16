module HVM2.Run.link where

open import Debug.Trace
open import Data.String.append
import Data.Bits.show as Bits
import HVM2.Term.show as Term

open import Data.Bits.Type
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Unit.Type
open import HVM2.Run.Type
open import HVM2.Run.bind
open import HVM2.Run.pure
open import HVM2.Run.push-redex
open import HVM2.Run.swap-subst
open import HVM2.Run.take-subst
open import HVM2.Term.Type

mutual
  -- Links two terms
  link : Term → Term → Run Unit
  link a b = trace ("link " ++ Term.show a ++ " ~ " ++ Term.show b) (link' a b) where
    link' : Term -> Term -> Run Unit
    link' (Var x) b       = subst x b
    link' a       (Var y) = subst y a
    link' a       b       = push-redex a b

  -- Substitutes a variable with a term
  subst : Bits → Term → Run Unit
  subst x b = do
    old-val ← swap-subst x b
    case old-val of λ where
      None        → pure unit
      (Some term) → do
        take-subst x
        link term b
