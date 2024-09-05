module Data.List.zip-with where

open import Data.List.Type

-- Zips two lists into a single list with a given function.
zip-with : ∀ {A B C : Set} → (A → B → C) → List A → List B → List C
zip-with f (x :: xs) (y :: ys) = f x y :: zip-with f xs ys
zip-with f _ _ = []
