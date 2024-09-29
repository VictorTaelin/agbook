module Base.Bits.show-rev where

open import Base.Bits.Bits
open import Base.Bits.reverse
open import Base.String.String
open import Base.String.append

-- Converts Bits to string with less significant values to the right.
-- - bits: The Bits value to reverse and convert.
-- = A string representation of the reversed Bits value.
show-rev : Bits → String
show-rev bits = go (reverse bits) where
  go : Bits → String
  go E        = ""
  go (O bits) = "0" ++ go bits
  go (I bits) = "1" ++ go bits
