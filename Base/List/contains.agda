module Base.List.contains where

open import Base.List.List
open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Trait.Eq

-- Checks if a list contains a specific element.
-- - x: The element to search for.
-- - xs: The list to search in.
-- = True if the element is found, False otherwise.
contains : ∀ {A : Set} {{EqA : Eq A}} → A → List A → Bool
contains x []        = False
contains x (y :: ys) = (x == y) || contains x ys
