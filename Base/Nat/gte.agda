module Base.Nat.gte where

open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Bool.or
open import Base.Nat.gt
open import Base.Nat.eq

-- Greater-than-or-equal-to comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is greater than or equal to y.
gte : Nat → Nat → Bool
gte x y = (x == y) || (gt x y)
