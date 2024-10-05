module Base.Char.gt where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.gt as Nat

-- Checks if one character is greater than another.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = True if the first character is greater than the second, False otherwise.
gt : Char → Char → Bool
gt x y = Nat.gt (to-nat x) (to-nat y)

-- Infix operator for greater-than comparison of characters.
infix 4 _>_
_>_ : Char → Char → Bool
_>_ = gt