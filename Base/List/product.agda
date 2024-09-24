module Base.List.product where

open import Base.List.Type
open import Base.List.foldr
open import Base.Nat.Type
open import Base.Nat.mul

-- Calculates the product of a list of natural numbers.
-- - xs: The input list of natural numbers.
-- = The product of all numbers in the list.
product : List Nat -> Nat
product = foldr _*_ 1
