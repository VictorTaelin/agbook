module Base.List.update-at where

open import Base.List.List
open import Base.Nat.Nat

-- Updates an element at a specific index in a list.
-- If the index is out of bounds, the original list is returned.
-- - xs: The input list.
-- - n: The index at which to update the element.
-- - f: The function to apply to the element at the specified index.
-- = A new list with the element at index n updated, or the original list if n is out of bounds.
update-at : ∀ {A : Set} → List A → Nat → (A → A) → List A
update-at []        _        f = []
update-at (x :: xs) Zero     f = f x :: xs
update-at (x :: xs) (Succ i) f = x :: update-at xs i f

