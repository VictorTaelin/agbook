module Data.List.is-cons where

open import Data.List.Type
open import Data.Bool.Type

-- Checks if a list is non-empty (cons).
-- - xs: The list to check.
-- = True if the list is non-empty, False otherwise.
is-cons : ∀ {A : Set} → List A → Bool
is-cons []       = False
is-cons (_ :: _) = True
