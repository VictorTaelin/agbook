module Data.Nat.lte where

open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Nat.eq
open import Data.Class.Eq
open import Data.Nat.lt

-- Less-than-or-equal-to comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than or equal to y.
lte : Nat → Nat → Bool
lte x y = (x == y) || (x < y)

_<=_ : Nat → Nat → Bool
_<=_ = lte
