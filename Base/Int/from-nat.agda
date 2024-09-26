module Base.Int.from-nat where

open import Base.Int.Int
open import Base.Nat.Nat

-- Converts a natural number to an integer.
-- - n: The natural number to convert.
-- = The corresponding integer representation.
from-nat : Nat -> Int
from-nat n = Pos n
