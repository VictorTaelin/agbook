module Base.Char.neq where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Bool.not
import Base.Char.eq as Char

-- Compares two characters for inequality.
-- This function determines if two given characters are different.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = True if the characters are not equal, False otherwise.
neq : Char → Char → Bool
neq x y = not (Char.eq x y)

-- Infix operator for character inequality.
infix 4 _!=_
_!=_ : Char → Char → Bool
_!=_ = neq