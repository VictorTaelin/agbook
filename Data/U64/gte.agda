module Data.U64.gte where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

-- Greater than or equal comparison for U64 numbers.
-- - x: The first U64 number to compare.
-- - y: The second U64 number to compare.
-- = True if x is greater than or equal to y, False otherwise.
gte : U64 → U64 → Bool
gte x y = helper (primWord64ToNat x) (primWord64ToNat y)
  where
    helper : Nat → Nat → Bool
    helper Zero     Zero     = True
    helper Zero     (Succ _) = False
    helper (Succ _) Zero     = True
    helper (Succ m) (Succ n) = helper m n

infix 4 _>=_

-- Infix operator for U64 greater than or equal comparison.
-- - Equivalent to the 'gte' function.
_>=_ : U64 → U64 → Bool
_>=_ = gte