module Nat.gt where

open import Nat.Main
open import Bool.Main

-- Greater-than comparison for nats.
-- - x: the 1st nat.
-- - y: the 2nd nat.
-- = True if x is greater than y.
_>_ : Nat → Nat → Bool
zero   > _      = false
succ _ > zero   = true
succ x > succ y = x > y
