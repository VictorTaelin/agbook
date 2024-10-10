module Base.Nat.gt where

open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Nat.lt

-- Checks if one natural number is greater than another.
-- - 1st: The natural number.
-- - 2nd: The natural number.
-- = True if the 1st number is greater than the 2nd, False otherwise.
gt : Nat → Nat → Bool
gt m n = n < m

-- Infix operator for greater-than comparison of natural numbers.
_>_ : Nat → Nat → Bool
_>_ = gt

infix 4 _>_

