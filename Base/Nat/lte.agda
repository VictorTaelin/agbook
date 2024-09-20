module Base.Nat.lte where

open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Bool.or
open import Base.Nat.eq
open import Base.Nat.lt

-- Less-than-or-equal-to comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than or equal to y.
lte : Nat → Nat → Bool
lte x y = (eq x y) || (lt x y)
