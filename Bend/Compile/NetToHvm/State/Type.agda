module Bend.Compile.NetToHvm.State.Type where

open import Base.String.Type
open import Base.BitMap.Type
open import Base.Nat.Type

record State : Set where
  constructor MkState
  field
    vars    : BitMap String
    n-vars  : Nat
    n-nodes : Nat
