module Data.U64.lt where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

-- Less than comparison for two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = True if x is less than y, False otherwise.
lt : U64 → U64 → Bool
lt x y = helper (primWord64ToNat x) (primWord64ToNat y)
  where
    helper : Nat → Nat → Bool
    helper Zero     Zero     = False
    helper Zero     (Succ _) = True
    helper (Succ _) Zero     = False
    helper (Succ m) (Succ n) = helper m n

infix 4 _<_

-- Infix operator for U64 less than comparison.
-- - Equivalent to the 'lt' function.
_<_ : U64 → U64 → Bool
_<_ = lt