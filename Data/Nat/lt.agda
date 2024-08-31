module Data.Nat.lt where

open import Data.Nat.Type
open import Data.Bool.Type

-- Less-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is less than y.
_<_ : Nat → Nat → Bool
Zero   < Zero   = False
Zero   < Succ _ = True
Succ x < Succ y = x < y
Succ _ < Zero   = False
