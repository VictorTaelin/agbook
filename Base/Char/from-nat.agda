module Base.Char.from-nat where

open import Base.Char.Char
open import Base.Nat.Nat

primitive
  primNatToChar : Nat → Char

-- Converts a natural number to its corresponding Unicode character.
-- 1st: The natural number to convert.
-- = The Unicode character corresponding to the given natural number.
from-nat : Nat → Char
from-nat = primNatToChar