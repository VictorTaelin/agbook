module Data.List.sum where

open import Data.List.Type
open import Data.List.foldr
open import Data.Nat.Type
open import Data.Nat.add

-- Calculates the sum of a list of natural numbers.
sum : List Nat → Nat
sum = foldr _+_ 0
