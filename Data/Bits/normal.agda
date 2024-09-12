module Data.Bits.normal where

open import Data.Bits.Type

-- Normalizes a Bits representation by removing trailing zeros from the left side.
-- - bits: The input Bits value to normalize.
-- = A new Bits value with trailing zeros removed.
normal : Bits → Bits
normal E = E
normal (O E) = E
normal (I bits) = I bits
normal (O bits) = (normal bits)
