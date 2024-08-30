module List.quicksort where

open import Bool.Main
open import Bool.not
open import List.Main
open import List.append
open import List.filter
open import Nat.Main
open import Nat.gt
open import Nat.lt

-- Quicksort algorithm for sorting lists of natural numbers.
-- - xs: the input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
quicksort : List Nat → List Nat
quicksort []       = []
quicksort (x , xs) = 
  let min = filter (λ y → y < x) xs
      max = filter (λ y → y > x) xs
  in quicksort min ++ (x , quicksort max)
