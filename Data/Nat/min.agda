module Data.Nat.min where

open import Data.Nat.Type
open import Data.Nat.lte
open import Data.Bool.if

-- Returns the minimum of two natural numbers.
-- - x: The first natural number.
-- - y: The second natural number.
-- = The smaller of x and y.
min : Nat → Nat → Nat
min x y = if x <= y then x else y
