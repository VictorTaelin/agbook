module Base.List.quicksort where

open import Base.List.Type
open import Base.List.append
open import Base.List.filter
open import Base.Nat.Type
open import Base.Nat.gt
open import Base.Nat.lt

-- Quicksort algorithm for sorting lists of natural numbers.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
quicksort : List Nat -> List Nat
quicksort []        = []
quicksort (x :: xs) = do
  let min = filter (λ y -> y < x) xs
  let max = filter (λ y -> y > x) xs
  quicksort min ++ (x :: quicksort max)
