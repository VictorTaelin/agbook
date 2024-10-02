module Base.Nat.neq where

open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Nat.Nat
open import Base.Nat.eq

-- Checks if two natural numbers are not equal.
-- 1st: The natural number to compare.
-- 2nd: The natural number to compare.
-- = True if the numbers are not equal, False otherwise.
neq : Nat → Nat → Bool
neq m n = not (m == n)

-- Infix operator for inequality comparison of natural numbers.
_!=_ : Nat → Nat → Bool
_!=_ = neq

infix 4 _!=_