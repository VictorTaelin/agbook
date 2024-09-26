module Base.List.is-cons where

open import Base.List.List
open import Base.Bool.Bool

-- Checks if a list is non-empty (cons).
-- - xs: The list to check.
-- = True if the list is non-empty, False otherwise.
is-cons : ∀ {A : Set} -> List A -> Bool
is-cons []       = False
is-cons (_ :: _) = True
