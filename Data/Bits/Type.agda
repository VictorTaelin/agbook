module Data.Bits.Type where

-- Represents a binary string.
-- - O: Represents a zero bit.
-- - I: Represents a one bit.
-- - E: Represents the end of the binary string.
-- Least significant bits are higher in the structure.
-- That is, `(O (I E))` is 10 in binary or 2 in decimal.
data Bits : Set where
  O : Bits → Bits
  I : Bits → Bits
  E : Bits

-- Examples:
-- E           represents an empty string
-- O E         represents "0"
-- I E         represents "1"
-- I (O E)     represents "01"
-- I (O (I E)) represents "101"
-- O (O (I E)) represents "100"
