module Base.List.cartesian-product-with where

open import Base.List.Type
open import Base.List.map
open import Base.List.append
open import Base.Pair.Type

-- Returns the cartesian product of two lists, applying a given function to each pair.
-- - f: The function to apply to each pair of elements.
-- - xs: The first input list.
-- - ys: The second input list.
-- = A new list containing the results of applying f to all possible pairs from xs and ys.
cartesian-product-with : ∀ {A B C : Set} → (A → B → C) → List A → List B → List C
cartesian-product-with f [] _ = []
cartesian-product-with f (x :: xs) ys = map (f x) ys ++ cartesian-product-with f xs ys
