module HVM.Term.reduce where

open import Data.Bits.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Nat.Type
open import HVM.Fun.Type
open import HVM.Fun.bind
open import HVM.Fun.fresh
open import HVM.Fun.lookup
open import HVM.Fun.pure
open import HVM.Fun.subst
open import HVM.Term.Type

mutual
  reduce-app : Term → Term → Fun Term
  reduce-app (Lam nam bod) arg = do
    subst nam arg
    pure (Lam nam bod)
  reduce-app fun arg = do
    pure (App fun arg)

  reduce-var : Bits → Fun Term
  reduce-var idx = do
    got ← lookup idx
    case got of λ where
      None        → pure (Var idx)
      (Some term) → reduce term

  reduce : Term → Fun Term
  reduce (Lam nam bod) = do
    pure (Lam nam bod)
  reduce (App fun arg) = do
    fun ← reduce fun
    reduce-app fun arg
  reduce (Var idx) = do
    reduce-var idx
