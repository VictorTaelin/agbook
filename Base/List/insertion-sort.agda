module Base.List.insertion-sort where

open import Base.List.Type
open import Base.Bool.Type
open import Base.List.insert-at-sorted

-- Sorts a list in ascending order using insertion sort.
-- - leq: The less-than-or-equal comparison function.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
insertion-sort : ∀ {A : Set} -> (A -> A -> Bool) -> List A -> List A
insertion-sort leq [] = []
insertion-sort leq (x :: xs) = insert-at-sorted leq x (insertion-sort leq xs)
