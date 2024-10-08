module Bend.Compile.NetToHvm.State.State where

open import Base.String.String
open import Base.BinMap.BinMap
open import Base.Nat.Nat

record State : Set where
  constructor MkState
  field
    vars    : BinMap String
    n-vars  : Nat
    n-nodes : Nat
