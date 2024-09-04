module HVM.Interaction.comm where

open import Data.Unit.Type
open import HVM.Runtime.Type
open import HVM.Runtime.bind
open import HVM.Runtime.fresh
open import HVM.Runtime.link
open import HVM.Runtime.pure
open import HVM.Term.Type

-- Commutation interaction
comm : Term → Term → Term → Term → Runtime Unit
comm a1 a2 b1 b2 = do
  v0 ← fresh
  v1 ← fresh
  v2 ← fresh
  v3 ← fresh
  let n0 = Con (Var v0) (Var v1)
  let n1 = Con (Var v2) (Var v3)
  let n2 = Dup (Var v0) (Var v2)
  let n3 = Dup (Var v1) (Var v3)
  link a1 n0
  link a2 n1
  link b1 n2
  link b2 n3
  pure unit
