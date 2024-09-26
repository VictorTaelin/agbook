module Base.List.concat-maybes where

open import Base.Maybe.Maybe
open import Base.List.List
open import Base.List.foldr

-- Concatenates all of the `Some` values in a list of Maybe.
-- - xs: The input list of Maybe values.
-- = A new list containing all the values from `Some` constructors.
concat-maybes : ∀ {A : Set} -> List (Maybe A) -> List A
concat-maybes xs = foldr go [] xs
  where
    go : ∀ {A : Set} -> Maybe A -> List A -> List A
    go None acc = acc
    go (Some x) acc = x :: acc
