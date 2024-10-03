module Base.List.concat-maybes where

open import Base.Maybe.Maybe
open import Base.List.List
open import Base.List.foldr

concat-maybes-go : ∀ {A : Set} → Maybe A → List A → List A
concat-maybes-go None acc = acc
concat-maybes-go (Some x) acc = x :: acc


-- Concatenates all of the `Some` values in a list of Maybe.
-- - xs: The input list of Maybe values.
-- = A new list containing all the values from `Some` constructors.
concat-maybes : ∀ {A : Set} → List (Maybe A) → List A
concat-maybes xs = foldr concat-maybes-go [] xs


