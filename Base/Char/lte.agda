module Base.Char.lte where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.lte as Nat

-- Checks if one character is less than or equal to another.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = True if the first character is less than or equal to the second, False otherwise.
lte : Char → Char → Bool
lte x y = Nat.lte (to-nat x) (to-nat y)

-- Infix operator for less-than-or-equal-to comparison of characters.
infix 4 _<=_
_<=_ : Char → Char → Bool
_<=_ = lte