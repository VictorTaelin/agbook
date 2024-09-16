module Data.Bits.show-rev where

open import Data.Bits.Type
open import Data.Bits.reverse
open import Data.String.Type
open import Data.String.append

-- Converts Bits to string with less significant values to the right.
-- - bits: The Bits value to reverse and convert.
-- = A string representation of the reversed Bits value.
show-rev : Bits → String
show-rev bits = go (reverse bits) where
  go : Bits → String
  go E        = ""
  go (O bits) = "0" ++ go bits
  go (I bits) = "1" ++ go bits
