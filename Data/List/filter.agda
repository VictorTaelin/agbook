module Data.List.filter where

open import Data.List.Type
open import Data.Bool.Type

-- Filters a list based on a predicate function.
-- - fn: The function used to test each element.
-- - xs: The input list.
-- = A new list containing only elements that satisfy the predicate.
filter : ∀ {A : Set} → (A → Bool) → List A → List A
filter fn []       = []
filter fn (x :: xs) with fn x
... | True  = x :: filter fn xs
... | False = filter fn xs
