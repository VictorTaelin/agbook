module Base.Nat.lt where

open import Base.Nat.Type
open import Base.Bool.Type

-- Less-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than y.
lt : Nat → Nat → Bool
lt Zero     Zero     = False
lt Zero     (Succ _) = True
lt (Succ _) Zero     = False
lt (Succ x) (Succ y) = lt x y

_<_ : Nat → Nat → Bool
_<_ = lt

infixl 4 _<_