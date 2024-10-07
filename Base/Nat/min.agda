module Base.Nat.min where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Trait.Ord

-- Returns the minimum of two natural numbers.
-- 1st: The natural number to compare.
-- 2nd: The natural number to compare.
-- = The smaller of the two input numbers.
min : Nat → Nat → Nat
min m n = if m <= n then m else n