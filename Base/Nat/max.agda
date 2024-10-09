module Base.Nat.max where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Trait.Ord

-- Returns the maximum of two natural numbers.
-- 1st: The first natural number to compare.
-- 2nd: The second natural number to compare.
-- = The larger of the two input numbers.
max : Nat → Nat → Nat
max m n = if m >= n then m else n

