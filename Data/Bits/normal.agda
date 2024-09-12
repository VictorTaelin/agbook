module Data.Bits.normal where

open import Data.Bits.Type

-- Normalizes a Bits representation by removing trailing zeros from the right side.
-- - bits: The input Bits value to normalize.
-- = A new Bits value with trailing zeros removed.
normal : Bits → Bits
normal E        = E
normal (I bits) = I (normal bits)
normal (O bits) with normal bits
... | E = E
... | s = O s
