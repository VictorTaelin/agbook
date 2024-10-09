module Base.Char.neq where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Bool.not
import Base.Char.eq as Char

-- Compares two characters for inequality.
-- 1st: The character to compare.
-- 2nd: The character to compare.
-- = True if the characters are not equal, False otherwise.
neq : Char → Char → Bool
neq x y = not (Char.eq x y)

-- Infix operator for character inequality.
_!=_ : Char → Char → Bool
_!=_ = neq

infix 4 _!=_

