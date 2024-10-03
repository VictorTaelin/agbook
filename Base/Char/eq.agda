module Base.Char.eq where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primCharEquality : Char → Char → Bool

-- Compares two characters for equality.
-- This function determines if two given characters are the same.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = True if the characters are equal, False otherwise.
eq : Char → Char → Bool
eq = primCharEquality

-- Infix operator for character equality.
infix 4 _==_
_==_ : Char → Char → Bool
_==_ = eq
