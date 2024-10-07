module Base.Char.lt where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.lt as Nat

-- Compares two characters lexicographically.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = True if the first character is less than the second, False otherwise.
lt : Char → Char → Bool
lt x y = Nat.lt (to-nat x) (to-nat y)

-- Infix operator for lexicographic comparison of characters.
_<_ : Char → Char → Bool
_<_ = lt

infix 4 _<_