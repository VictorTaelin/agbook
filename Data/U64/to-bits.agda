module Data.U64.to-bits where

open import Data.U64.Type
open import Data.Bits.Type
open import Data.U64.mod
open import Data.U64.div
open import Data.U64.if
open import Data.Nat.Type
open import Data.Bool.Type

-- Helper function for to_bits that handles the recursive case.
-- - n: The remaining part of the U64 number to convert.
-- = The binary representation of the number as Bits.
{-# TERMINATING #-}
to-bits-helper : U64 → Bits
to-bits-helper n =
  let two = primWord64FromNat 2
      quotient = divU64 n two
      remainder = modU64 n two
  in ifU64 remainder
      (I (to-bits-helper quotient))
      (O (to-bits-helper quotient))

-- Converts a U64 number to its binary representation.
-- - n: The U64 number to convert.
-- = The binary representation of the number as Bits.
to-bits : U64 → Bits
to-bits n = 
  ifU64 n
    (to-bits-helper n)
    (O E)
