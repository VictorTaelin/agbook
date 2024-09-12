module Bend.Compile.NetToHvm.State.Type where

open import Data.Bits.Type
open import Data.Map.Type
open import Data.Nat.Type

record State : Set where
  constructor MkState
  field
    vars : Map Bits
    n-vars : Nat
    n-nodes : Nat
