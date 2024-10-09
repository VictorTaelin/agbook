module HVM.Rule.comm where

open import Base.Unit.Unit
open import HVM.Run.Monad.bind
open import HVM.Run.Monad.pure
open import HVM.Run.Run
open import HVM.Run.fresh
open import HVM.Run.link
open import HVM.Term.Term

-- Commutation interaction
comm : Term → Term → Term → Term → Run Unit
comm a1 a2 b1 b2 = do
  v0 ← fresh
  v1 ← fresh
  v2 ← fresh
  v3 ← fresh
  let n0 = Dup (Var v2) (Var v0)
  let n1 = Dup (Var v3) (Var v1)
  let n2 = Con (Var v0) (Var v1)
  let n3 = Con (Var v2) (Var v3)
  link a1 n0
  link a2 n1
  link b1 n2
  link b2 n3

