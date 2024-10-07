module Base.Nat.lte where

open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.lt

-- Checks if one natural number is less than or equal to another.
-- - 1st: The natural number.
-- - 2nd: The natural number.
-- = True if the 1st number is less than or equal to the 2nd, False otherwise.
lte : Nat → Nat → Bool
lte m n = (m < n) || (m == n)

-- Infix operator for less-than-or-equal-to comparison of natural numbers.
_<=_ : Nat → Nat → Bool
_<=_ = lte

infix 4 _<=_