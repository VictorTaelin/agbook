module Base.Nat.gt where

open import Base.Nat.Type
open import Base.Bool.Type

-- Greater-than comparison for nats.
-- - x: The 1st nat.
-- - y: The 2nd nat.
-- = True if x is greater than y.
gt : Nat → Nat → Bool
gt Zero     _        = False
gt (Succ _) Zero     = True
gt (Succ x) (Succ y) = gt x y
