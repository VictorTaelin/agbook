module Bend.Compile.NetToHvm.State.State where

open import Base.String.String
open import Base.BitMap.BitMap
open import Base.Nat.Nat

record State : Set where
  constructor MkState
  field
    vars    : BitMap String
    n-vars  : Nat
    n-nodes : Nat
