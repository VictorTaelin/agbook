module Data.Bits.Type where

-- Represents a binary string.
-- - O: Represents a zero bit.
-- - I: Represents a one bit.
-- - E: Represents the end of the binary string.
data Bits : Set where
  O : Bits → Bits
  I : Bits → Bits
  E : Bits

-- Examples:
-- E           represents an empty string
-- O E         represents "0"
-- I E         represents "1"
-- O (I E)     represents "01"
-- I (O (I E)) represents "101"
