module Data.List.any where

open import Data.List.Type
open import Data.List.foldr
open import Data.Bool.Type
open import Data.Bool.or

-- Checks if any element of a list satisfies a given predicate.
-- - p: The predicate function to apply to each element.
-- - xs: The input list.
-- = True if any element satisfies the predicate, False otherwise.
any : ∀ {A : Set} → (A → Bool) → List A → Bool
any p = foldr (λ x acc → p x || acc) False
