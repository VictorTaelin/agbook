module Base.List.insert-at where

open import Base.List.Type
open import Base.Nat.Type

-- Inserts an element at a specific index in a list.
-- If the index is out of bounds, the element is appended to the end of the list.
-- - n: The index at which to insert the element.
-- - x: The element to insert.
-- - xs: The input list.
-- = A new list with the element inserted at the specified index.
insert-at : ∀ {A : Set} -> List A -> Nat -> A -> List A
insert-at xs        Zero     v = v :: xs
insert-at []        (Succ i) v = v :: []
insert-at (x :: xs) (Succ i) v = x :: insert-at xs i v
