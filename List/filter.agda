module List.filter where

open import List.Main
open import Bool.Main

-- Filters a list based on a predicate function.
-- - fn: the function used to test each element.
-- - xs: the input list.
-- = A new list containing only elements that satisfy the predicate.
filter : ∀ {A : Set} → (A → Bool) → List A → List A
filter fn []       = []
filter fn (x , xs) with fn x
... | true  = x , filter fn xs
... | false = filter fn xs
