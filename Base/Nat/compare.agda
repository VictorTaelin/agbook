module Base.Nat.compare where

open import Base.Ordering.Type
open import Base.Nat.Type

-- Compares two natural numbers.
-- - m: The first natural number.
-- - n: The second natural number.
-- = LT if m < n, EQ if m = n, GT if m > n.
compare : Nat → Nat → Ordering
compare Zero     Zero     = EQ
compare Zero     (Succ _) = LT
compare (Succ _) Zero     = GT
compare (Succ m) (Succ n) = compare m n
