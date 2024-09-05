module Data.List.concat-maybes where

open import Data.Maybe.Type
open import Data.List.Type
open import Data.List.foldr

-- Concatenate all of the `Some` values in a list of Maybe.
concat-maybes : ∀ {A : Set} → List (Maybe A) → List A
concat-maybes xs = foldr go [] xs
  where
    go : ∀ {A : Set} → Maybe A → List A → List A
    go None acc = acc
    go (Some x) acc = x :: acc
