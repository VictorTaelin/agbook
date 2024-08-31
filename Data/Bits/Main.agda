module Data.Bits.Main where

-- Represents a binary string.
-- - o: Represents a zero bit.
-- - i: Represents a one bit.
-- - e: Represents the end of the binary string.
data Bits : Set where
  o : Bits → Bits
  i : Bits → Bits
  e : Bits

-- Examples:
-- e          represents an empty string
-- o e        represents "0"
-- i e        represents "1"
-- o (i e)    represents "01"
-- i (o (i e)) represents "101"
