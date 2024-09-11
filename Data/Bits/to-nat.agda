module Data.Bits.to-nat where

open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Nat.mul

-- Converts a Bits value to its corresponding natural number.
-- The rightmost bit is the least significant.
-- - bits: The Bits value to convert.
-- = The natural number representation of the Bits value.
to-nat : Bits → Nat
to-nat bits = go bits Zero 1 where
  go : Bits → Nat → Nat → Nat
  go E      acc _      = acc
  go (O bs) acc weight = go bs acc (2 * weight)
  go (I bs) acc weight = go bs (acc + weight) (2 * weight)
