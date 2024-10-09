module Base.Char.compare where

open import Base.Char.Char
open import Base.Char.to-nat
open import Base.Ordering.Ordering
import Base.Nat.compare as Nat

-- Compares two characters and returns their ordering.
-- 1st: The first character to compare.
-- 2nd: The second character to compare.
-- = An Ordering value: LT if 1st < 2nd, EQ if 1st = 2nd, GT if 1st > 2nd.
compare : Char → Char → Ordering
compare x y = Nat.compare (to-nat x) (to-nat y)

