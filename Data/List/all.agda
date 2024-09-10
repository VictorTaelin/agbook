module Data.List.all where

open import Data.List.Type
open import Data.List.foldr
open import Data.Bool.Type
open import Data.Bool.and

-- Checks if all elements of a list satisfy a given predicate.
-- - p: The predicate function to apply to each element.
-- - xs: The input list.
-- = True if all elements satisfy the predicate, False otherwise.
all : ∀ {A : Set} → (A → Bool) → List A → Bool
all p = foldr (λ x acc → p x && acc) True
