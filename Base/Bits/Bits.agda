module Base.Bits.Bits where

-- Represents a binary string.
-- - O: Represents a zero bit.
-- - I: Represents a one bit.
-- - E: Represents the end of the binary string.
-- Least significant bits are higher in the structure.
-- That is, `(O (I E))` is 10 in binary or 2 in decimal.
-- E           represents empty (0)
-- O E         represents 0b0 (0)
-- I E         represents 0b1 (1)
-- O (I E)     represents 0b10 (2)
-- O (O (I E)) represents 0b100 (4)
-- O (I (I E)) represents 0b110 (5)
data Bits : Set where
  O : Bits -> Bits
  I : Bits -> Bits
  E : Bits
