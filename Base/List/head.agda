module Base.List.head where

open import Base.List.List
open import Base.Maybe.Maybe

-- Safely retrieves the 1st element of a list.
-- - A: The type of elements in the list.
-- - xs: The input list.
-- = Some x if the list is non-empty (where x is the 1st element),
--   None if the list is empty.
head : ∀ {A : Set} → List A → Maybe A
head []       = None
head (x :: _) = Some x
