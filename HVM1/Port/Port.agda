module HVM1.Port.Port where

open import Base.Bits.Bits
open import Base.Nat.Nat

-- Represents a port in the HVM1 system
record Port : Set where
  constructor To
  field
    addr : Bits
    slot : Nat
