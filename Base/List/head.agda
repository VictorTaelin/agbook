module Base.List.head where

open import Base.List.Type
open import Base.Maybe.Type

-- Safely retrieves the 1st element of a list.
-- - xs: The input list.
-- = (Some xs[0]) if xs is non-empty, None otherwise.
head : ∀ {A : Set} → List A → Maybe A
head []       = None
head (x :: _) = Some x
