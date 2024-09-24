module Base.DiffList.to-list where

open import Base.DiffList.Type
open import Base.List.Type

-- Converts a DiffList to a List.
-- - xs: The DiffList to convert.
-- = A List containing all elements from the DiffList.
to-list : ∀ {A : Set} -> DiffList A -> List A
to-list xs = xs []
