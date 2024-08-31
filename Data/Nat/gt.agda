module Data.Nat.gt where

open import Data.Nat.Type
open import Data.Bool.Type

-- Greater-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is greater than y.
_>_ : Nat → Nat → Bool
Zero   > _      = False
Succ _ > Zero   = True
Succ x > Succ y = x > y
