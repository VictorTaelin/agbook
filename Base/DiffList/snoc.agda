module Base.DiffList.snoc where

open import Base.DiffList.Type
open import Base.List.Type

-- Adds an element to the end of a DiffList.
-- - x: The element to add.
-- - xs: The DiffList to add the element to.
-- = A new DiffList with x added to the end.
snoc : ∀ {A : Set} -> A -> DiffList A -> DiffList A
snoc x xs = λ tail -> (xs (x :: tail))
