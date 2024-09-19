module Base.List.quicksort where

open import Base.Bool.Type
open import Base.Bool.not
open import Base.List.Type
open import Base.List.append
open import Base.List.filter
open import Base.Nat.Type
open import Base.Nat.Ord
open import Base.Trait.Ord

-- Quicksort algorithm for sorting lists of natural numbers.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
quicksort : List Nat → List Nat
quicksort []        = []
quicksort (x :: xs) = 
  let min = filter (λ y → _<_ {{OrdNat}} y x) xs
      max = filter (λ y → _>_ {{OrdNat}} y x) xs
  in quicksort min ++ (x :: quicksort max)
