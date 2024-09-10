module Data.Nat.gte where

open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Trait.Eq
open import Data.Nat.gt
open import Data.Nat.eq

-- Greater-than-or-equal-to comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is greater than or equal to y.
gte : Nat → Nat → Bool
gte x y = (x == y) || (x > y)

_>=_ : Nat → Nat → Bool
_>=_ = gte
