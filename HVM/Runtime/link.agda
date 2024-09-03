module HVM.Runtime.link where

open import Data.Bits.Type
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.pure
open import HVM.Runtime.push-redex
open import HVM.Runtime.swap-subst
open import HVM.Runtime.take-subst
open import HVM.Term.Type

mutual
  -- Links two terms
  link : Term → Term → Runtime Unit
  link (Var x) b       = subst x b
  link a       (Var y) = subst y a
  link a       b       = push-redex a b

  -- Substitutes a variable with a term
  subst : Bits → Term → Runtime Unit
  subst x b = do
    old-val ← swap-subst x b
    case old-val of λ where
      None        → pure unit
      (Some term) → do
        take-subst x
        link term b
