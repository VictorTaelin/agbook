module HVM.Run.State.State where

open import Base.Nat.Nat
open import Base.OrdMap.OrdMap
open import Base.String.String
open import HVM.Net.Net
open import HVM.Term.Term

record State : Set where
  constructor MkState
  field
    gnet : Net
    subs : OrdMap String Term
    vars : Nat

