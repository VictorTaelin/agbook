module Base.DiffList.cons where

open import Base.DiffList.DiffList
open import Base.List.List

-- Adds an element to the front of a DiffList.
-- - x: The element to add.
-- - xs: The DiffList to add the element to.
-- = A new DiffList with x added to the front.
cons : ∀ {A : Set} → A → DiffList A → DiffList A
cons x xs = λ tail → x :: (xs tail)

