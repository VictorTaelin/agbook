module Base.Bits.take where

open import Base.Bits.Bits
open import Base.Nat.Nat

-- Takes the first n bits from a Bits structure.
-- If n is greater than the length of the Bits, returns the entire Bits structure.
-- - n: The number of bits to take.
-- - bits: The input Bits structure.
-- = A Bits structure containing the first n bits of the input, or all of the input if n > length bits.
take : Nat -> Bits -> Bits
take Zero     _       = E
take (Succ _) E       = E
take (Succ n) (O bits) = O (take n bits)
take (Succ n) (I bits) = I (take n bits)
