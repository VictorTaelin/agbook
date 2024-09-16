module HVM1.Port.Type where

open import Data.Bits.Type
open import Data.Nat.Type

-- Represents a port in the HVM1 system
record Port : Set where
  constructor To
  field
    addr : Bits
    slot : Nat
