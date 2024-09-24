module Bend.Compile.NetToHvm.State.Type where

open import Base.Bits.Type
open import Base.BitMap.Type
open import Base.Nat.Type

record State : Set where
  constructor MkState
  field
    vars    : BitMap Bits
    n-vars  : Nat
    n-nodes : Nat
