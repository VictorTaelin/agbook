module Data.Nat.max where

open import Data.Nat.Type
open import Data.Nat.gte
open import Data.Bool.if

-- Returns the maximum of two natural numbers.
-- - x: The first natural number.
-- - y: The second natural number.
-- = The larger of x and y.
max : Nat → Nat → Nat
max x y = if x >= y then x else y
