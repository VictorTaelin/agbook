module List.filter where

open import List.Main
open import Data.Bool

-- Filters a list based on a predicate function
-- - fn the function used to test each element
-- - xs: the input list
-- = a new list containing only elements that satisfy the predicate
filter : ∀ {A : Set} → (A → Bool) → List A → List A
filter fn Nil = Nil
filter fn (Cons x xs) with fn x
... | true  = Cons x (filter fn xs)
... | false = filter fn xs
