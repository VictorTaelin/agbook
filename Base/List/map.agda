module Base.List.map where

open import Base.List.Type

-- Applies a function to each element of a list.
-- - fn: The function to be applied.
-- - xs: The elements to apply f to.
-- = A new list with f applied to all elements.
map : ∀ {A B : Set} -> (A -> B) -> List A -> List B
map fn []        = []
map fn (x :: xs) = fn x :: map fn xs
