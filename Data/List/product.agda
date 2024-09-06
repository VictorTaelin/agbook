module Data.List.product where

open import Data.List.Type
open import Data.List.foldr
open import Data.Nat.Type
open import Data.Nat.mul

-- Calculates the product of a list of natural numbers.
-- - xs: The input list of natural numbers.
-- = The product of all numbers in the list.
product : List Nat → Nat
product = foldr _*_ 1
