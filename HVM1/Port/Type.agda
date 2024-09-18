module HVM1.Port.Type where

open import Base.Bits.Type
open import Base.Nat.Type

-- Represents a port in the HVM1 system
record Port : Set where
  constructor To
  field
    addr : Bits
    slot : Nat
