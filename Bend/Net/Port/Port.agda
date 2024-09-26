module Bend.Net.Port.Port where

open import Base.Nat.Nat

record Port : Set where
  constructor MkPort
  field
    node-id : Nat
    slot-id : Nat
