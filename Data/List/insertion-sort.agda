module Data.List.insertion-sort where

open import Data.List.Type
open import Data.Bool.Type
open import Data.List.insert-at-sorted

-- Sorts a list in ascending order using insertion sort.
-- - leq: The less-than-or-equal comparison function.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
insertion-sort : ∀ {A : Set} → (A → A → Bool) → List A → List A
insertion-sort leq [] = []
insertion-sort leq (x :: xs) = insert-at-sorted leq x (insertion-sort leq xs)
