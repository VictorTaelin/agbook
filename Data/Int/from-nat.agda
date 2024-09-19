module Data.Int.from-nat where

open import Data.Int.Type
open import Data.Nat.Type

-- Converts a natural number to an integer.
-- - n: The natural number to convert.
-- = The corresponding integer representation.
from-nat : Nat → Int
from-nat n = Pos n
