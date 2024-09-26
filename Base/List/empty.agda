module Base.List.empty where

open import Base.List.List
open import Base.Bool.Bool

-- Checks if a list is empty.
-- - xs: The input list to check.
-- = True if the list is empty, False otherwise.
empty : ∀ {A : Set} -> List A -> Bool
empty [] = True
empty  _ = False
