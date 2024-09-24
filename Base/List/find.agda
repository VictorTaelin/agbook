module Base.List.find where

open import Base.List.Type
open import Base.Maybe.Type
open import Base.Bool.Type

-- Finds the first element in a list that satisfies a given predicate.
-- - pred: The predicate function to test elements.
-- - xs: The input list to search.
-- = Some x if an element x satisfying the predicate is found,
--   None if no such element exists in the list.
find : ∀ {A : Set} -> (A -> Bool) -> List A -> Maybe A
find pred []       = None
find pred (x :: xs) with pred x
... | True  = Some x
... | False = find pred xs
