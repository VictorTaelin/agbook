module Data.Bits.reverse where

open import Data.Bits.Type
open import Data.Bits.append

-- Reverses the order of bits in a Bits value.
-- - bs: The input Bits value to be reversed.
-- = A new Bits value with the bits in reverse order.
reverse : Bits → Bits
reverse E = E
reverse (O bs) = append (reverse bs) (O E)
reverse (I bs) = append (reverse bs) (I E)
