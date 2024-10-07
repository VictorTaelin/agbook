module Base.Nat.gte where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.lte

-- Checks if the first natural number is greater than or equal to the second.
-- This function compares two natural numbers for the greater than or equal relation.
-- - m: The 1st natural number.
-- - n: The 2nd natural number.
-- = True if m is greater than or equal to n, False otherwise.
gte : Nat → Nat → Bool
gte m n = n <= m

-- Infix operator for greater than or equal comparison of natural numbers.
_>=_ : Nat → Nat → Bool
_>=_ = gte

infix 4 _>=_