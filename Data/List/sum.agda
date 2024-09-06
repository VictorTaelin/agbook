module Data.List.sum where

open import Data.List.Type
open import Data.List.foldr
open import Data.Nat.Type
open import Data.Nat.add

-- Calculates the sum of a list of natural numbers.
-- - xs: The input list of natural numbers.
-- = The sum of all numbers in the list.
sum : List Nat → Nat
sum = foldr _+_ Zero
