module Data.U64.gt where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.gt renaming (_>_ to _n>_; gt to ngt)

-- Greater than comparison for U64 numbers.
-- - x: The first U64 number to compare.
-- - y: The second U64 number to compare.
-- = A Bool indicating whether x is greater than y.
gt : U64 → U64 → Bool
gt x y = primWord64ToNat x n> primWord64ToNat y

infix 5 _>_
-- Infix operator for U64 greater than comparison.
-- - Equivalent to the 'gt' function.
_>_ : U64 → U64 → Bool
_>_ = gt