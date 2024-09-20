module Base.Nat.eq where

open import Base.Nat.Type
open import Base.Bool.Type

-- Equality comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is equal to y.
eq : Nat → Nat → Bool
eq Zero     Zero     = True
eq Zero     (Succ _) = False
eq (Succ _) Zero     = False
eq (Succ x) (Succ y) = eq x y

_==_ : Nat → Nat → Bool
_==_ = eq

infixl 4 _==_