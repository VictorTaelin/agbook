module Base.List.sort where

open import Base.List.List
open import Base.Bool.Bool
open import Base.List.insertion-sort

-- Sorts a list in ascending order.
-- - leq: The less-than-or-equal comparison function.
-- - xs: The input list to be sorted.
-- = A new list containing all elements from xs in ascending order.
sort : ∀ {A : Set} → (A → A → Bool) → List A → List A
sort = insertion-sort

-- TODO: Use a better sorting algorithm 

