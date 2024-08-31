module Data.Bits.inc where

open import Data.Bits.Type
open import Data.Bool.Type

-- Increments a binary string by one.
-- - bs: The input binary string.
-- = The incremented binary string.
inc : Bits → Bits
inc E      = I E
inc (O bs) = I bs
inc (I bs) = O (inc bs)
