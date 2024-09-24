module Base.List.sum where

open import Base.List.Type
open import Base.List.foldr
open import Base.Nat.Type
open import Base.Nat.add

-- Calculates the sum of a list of natural numbers.
-- - xs: The input list of natural numbers.
-- = The sum of all numbers in the list.
sum : List Nat -> Nat
sum = foldr _+_ Zero
