module Data.Nat.lt where

open import Data.Nat.Type
open import Data.Bool.Type

-- Less-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than y.
_<_ : Nat → Nat → Bool
zero   < zero   = false
zero   < succ _ = true
succ x < succ y = x < y
succ _ < zero   = false
