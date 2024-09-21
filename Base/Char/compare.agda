module Base.Char.compare where

open import Base.Char.Type
open import Base.Char.to-nat
open import Base.Ordering.Type
import Base.Nat.compare as Nat

-- Compares two characters.
-- - x: The first character.
-- - y: The second character.
-- = LT if x < y, EQ if x = y, GT if x > y.
compare : Char → Char → Ordering
compare x y = Nat.compare (to-nat x) (to-nat y)
