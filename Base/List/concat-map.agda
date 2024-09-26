module Base.List.concat-map where

open import Base.List.List
open import Base.List.concat
open import Base.List.map

-- Maps elements of a list to lists and concatenates the results.
-- - f: The function that maps elements to lists.
-- - xs: The input list.
-- = A new list containing all elements from the lists produced by f.
concat-map : ∀ {A B : Set} -> (A -> List B) -> List A -> List B
concat-map f xs = concat (map f xs)
