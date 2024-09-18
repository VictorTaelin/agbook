module Bend.Net.Port.Type where

open import Base.Nat.Type

record Port : Set where
  constructor MkPort
  field
    node-id : Nat
    slot-id : Nat
