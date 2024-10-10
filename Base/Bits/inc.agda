module Base.Bits.inc where

open import Base.Bits.Bits

-- Increments a binary string by one. Keeps the same length.
-- - bs: The input binary string.
-- = The incremented binary string.
inc : Bits → Bits
inc E      = I E
inc (O bs) = I bs
inc (I bs) = O (inc bs)

