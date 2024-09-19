module Base.List.Monad.bind where

open import Base.List.Type
open import Base.List.append

-- The bind function for the List monad.
-- Applies a function that returns a list to each element of a list,
-- then flattens the result.
-- - xs: The input list.
-- - f: The function to apply to each element.
-- = A new list resulting from applying f to each element and concatenating the results.
bind : ∀ {A B : Set} → List A → (A → List B) → List B
bind []        f = []
bind (x :: xs) f = f x ++ bind xs f


