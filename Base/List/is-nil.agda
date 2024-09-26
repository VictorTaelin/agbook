module Base.List.is-nil where

open import Base.List.List
open import Base.Bool.Bool

-- Checks if a list is empty (nil).
-- - xs: The list to check.
-- = True if the list is empty, False otherwise.
is-nil : ∀ {A : Set} -> List A -> Bool
is-nil []       = True
is-nil (_ :: _) = False
