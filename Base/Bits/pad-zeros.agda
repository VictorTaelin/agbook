module Base.Bits.pad-zeros where

open import Base.Bits.Bits
open import Base.Nat.Nat

-- Pads Bits with insignificant zeroes to achieve a specific length.
-- - n: The desired length of the resulting Bits.
-- - bits: The original Bits to be padded.
-- = A new Bits value with the same significance as the input, 
--   but padded with leading zeroes to reach the specified length.
pad-zeros : Nat → Bits → Bits
pad-zeros Zero     bits     = bits
pad-zeros (Succ n) E        = O (pad-zeros n E)
pad-zeros (Succ n) (O bits) = O (pad-zeros n bits)
pad-zeros (Succ n) (I bits) = I (pad-zeros n bits)

