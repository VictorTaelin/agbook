module Base.DiffList.to-list where

open import Base.DiffList.DiffList
open import Base.List.List

-- Converts a DiffList to a List.
-- - xs: The DiffList to convert.
-- = A List containing all elements from the DiffList.
to-list : ∀ {A : Set} → DiffList A → List A
to-list xs = xs []

