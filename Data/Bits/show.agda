module Data.Bits.show where

open import Data.Bits.Type
open import Data.String.Type
open import Data.String.append

-- Converts a Bits value to its string representation.
-- - bits: The Bits value to convert.
-- = A string representation of the Bits value.
show : Bits → String
show E        = "e"
show (O bits) = "o" ++ show bits
show (I bits) = "i" ++ show bits
