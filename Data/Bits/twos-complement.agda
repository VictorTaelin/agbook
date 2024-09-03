module Data.Bits.twos-complement where

open import Data.Bits.Type
open import Data.Bits.not
open import Data.Bits.inc

-- Computes the two's complement of a Bits value.
-- - bits: The input Bits value.
-- = A new Bits value representing the two's complement of the input.
twos-complement : Bits → Bits
twos-complement E = E
twos-complement bits = inc (not bits)

-- Example:
-- Input: a = 1101 (I (I (O (I E))))
-- not a: 0010 (O (O (I (O E))))
-- twos-complement: 0011 (O (O (I (I E))))