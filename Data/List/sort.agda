module Data.List.sort where

open import Data.List.Type
open import Data.Bool.Type
open import Data.List.insertion-sort

-- Sorts a list in ascending order.
-- - leq: The less-than-or-equal comparison function.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
sort : ∀ {A : Set} → (A → A → Bool) → List A → List A
sort = insertion-sort

-- TODO: Use a better sorting algorithm 
