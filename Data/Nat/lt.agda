module Data.Nat.lt where

open import Data.Nat.Type
open import Data.Bool.Type

-- Less-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than y.
lt : Nat → Nat → Bool
lt Zero     Zero     = False
lt Zero     (Succ _) = True
lt (Succ x) (Succ y) = lt x y
lt (Succ _) Zero     = False

_<_ : Nat → Nat → Bool
_<_ = lt
