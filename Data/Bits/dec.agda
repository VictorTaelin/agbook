module Data.Bits.dec where

open import Data.Bits.Type

-- Decrements a binary string by one.
-- - bs: The input binary string.
-- = The decremented binary string.
dec : Bits → Bits
dec E      = E
dec (I E)  = O E
dec (O bs) = I (dec bs)
dec (I bs) = O bs