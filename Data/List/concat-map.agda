module Data.List.concat-map where

open import Data.List.Type
open import Data.List.concat
open import Data.List.map

-- Maps elements of a list to another list and concatenates them.
concat-map : ∀ {A B : Set} → (A → List B) → List A → List B
concat-map f xs = concat (map f xs)
