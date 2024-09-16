module Data.U64.lte where

open import Data.U64.Type
open import Data.Bool.Type
open import Data.Nat.Type

-- Less than or equal comparison for U64 numbers.
-- - x: The first U64 number to compare.
-- - y: The second U64 number to compare.
-- = A Bool indicating whether x is less than or equal to y.
lte : U64 → U64 → Bool
lte x y = helper (primWord64ToNat x) (primWord64ToNat y)
  where
    -- Helper function to compare natural numbers.
    -- - Recursively compares the natural number representations of U64 values.
    helper : Nat → Nat → Bool
    helper Zero Zero = True
    helper Zero (Succ _) = True
    helper (Succ _) Zero = False
    helper (Succ m) (Succ n) = helper m n

infix 4 _<=_

-- Infix operator for U64 less than or equal comparison.
-- - Equivalent to the 'lte' function.
_<=_ : U64 → U64 → Bool
_<=_ = lte