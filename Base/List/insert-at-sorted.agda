module Base.List.insert-at-sorted where

open import Base.List.Type
open import Base.Bool.Type

-- Inserts an element into a sorted list, maintaining the sort order.
-- - leq: The less-than-or-equal comparison function.
-- - x: The element to insert.
-- - xs: The sorted input list.
-- = A new sorted list with x inserted in the correct position.
insert-at-sorted : ∀ {A : Set} -> (A -> A -> Bool) -> A -> List A -> List A
insert-at-sorted leq x [] = x :: []
insert-at-sorted leq x (y :: ys) with leq x y
... | True  = x :: y :: ys
... | False = y :: insert-at-sorted leq x ys
