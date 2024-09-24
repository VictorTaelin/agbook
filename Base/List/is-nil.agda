module Base.List.is-nil where

open import Base.List.Type
open import Base.Bool.Type

-- Checks if a list is empty (nil).
-- - xs: The list to check.
-- = True if the list is empty, False otherwise.
is-nil : ∀ {A : Set} -> List A -> Bool
is-nil []       = True
is-nil (_ :: _) = False
