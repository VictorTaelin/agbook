module Base.Bits.dec where

open import Base.Bits.Type

-- Decrements a binary string by one. Keeps the same length.
-- - bs: The input binary string.
-- = The decremented binary string.
dec : Bits → Bits
dec E      = E
dec (O bs) = I (dec bs)
dec (I bs) = O bs
