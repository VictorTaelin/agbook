module Data.List.filter where

open import Data.List.Main
open import Data.Bool.Main

-- Filters a list based on a predicate function.
-- - fn: The function used to test each element.
-- - xs: The input list.
-- = A new list containing only elements that satisfy the predicate.
filter : ∀ {A : Set} → (A → Bool) → List A → List A
filter fn []       = []
filter fn (x , xs) with fn x
... | true  = x , filter fn xs
... | false = filter fn xs
