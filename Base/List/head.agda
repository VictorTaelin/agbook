module Base.List.head where

open import Base.List.Type
open import Base.Maybe.Type

-- Safely retrieves the first element of a list.
-- - xs: The input list.
-- = Some x if the list is non-empty (where x is the first element),
--   None if the list is empty.
head : ∀ {A : Set} → List A → Maybe A
head []       = None
head (x :: _) = Some x
