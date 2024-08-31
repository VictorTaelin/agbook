module Data.List.quicksort where

open import Data.Bool.Type
open import Data.Bool.not
open import Data.List.Type
open import Data.List.append
open import Data.List.filter
open import Data.Nat.Type
open import Data.Nat.gt
open import Data.Nat.lt

-- Quicksort algorithm for sorting lists of natural numbers.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
quicksort : List Nat → List Nat
quicksort []        = []
quicksort (x :: xs) = 
  let min = filter (λ y → y < x) xs
      max = filter (λ y → y > x) xs
  in quicksort min ++ (x :: quicksort max)
