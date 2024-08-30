module List.map where

open import List.Main

-- Applies a function to each element of a list.
-- - f: the function to be applied
-- - xs: the elements to apply f to
-- = a new list with f applied to all elements
map : ∀ {A B : Set} → (A → B) → List A → List B
map f []        = []
map f (x ++ xs) = (f x) ++ (map f xs)
