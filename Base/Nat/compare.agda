module Base.Nat.compare where

open import Base.Nat.Nat
open import Base.Ordering.Ordering

-- Compares two natural numbers and returns their ordering.
-- This function determines the relative order of two given natural numbers.
-- 1st: The first natural number to compare.
-- 2nd: The second natural number to compare.
-- = LT if the first number is less than the second, EQ if they are equal, or GT if the first is greater than the second.
compare : Nat → Nat → Ordering
compare Zero     Zero     = EQ
compare Zero     (Succ _) = LT
compare (Succ _) Zero     = GT
compare (Succ m) (Succ n) = compare m n