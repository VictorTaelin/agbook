module Data.List.head where

open import Data.List.Type
open import Data.Maybe.Type

-- Safely retrieves the first element of a list.
-- - xs: The input list.
-- = Some x if the list is non-empty (where x is the first element),
--   None if the list is empty.
head : ∀ {A : Set} → List A → Maybe A
head []       = None
head (x :: _) = Some x
