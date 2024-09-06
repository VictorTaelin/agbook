module Data.List.zip-with where

open import Data.List.Type

-- Zips two lists into a single list using a combining function.
-- - f: The function to combine elements from both lists.
-- - xs: The first input list.
-- - ys: The second input list.
-- = A new list where each element is the result of applying f to
--   corresponding elements from xs and ys.
zip-with : ∀ {A B C : Set} → (A → B → C) → List A → List B → List C
zip-with f (x :: xs) (y :: ys) = f x y :: zip-with f xs ys
zip-with f _         _         = []
