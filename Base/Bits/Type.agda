module Base.Bits.Type where

-- Represents a binary string.
-- - O: Represents a zero bit.
-- - I: Represents a one bit.
-- - E: Represents the end of the binary string.
-- Least significant bits are leftmost. Examples:
-- (E)           represents nil (0)
-- (O E)         represents 0b0 (0)
-- (I E)         represents 0b1 (1)
-- (O (I E))     represents 0b10 (2)
-- (O (I (I E))) represents 0b110 (6)
data Bits : Set where
  O : (tail : Bits) → Bits
  I : (tail : Bits) → Bits
  E : Bits
