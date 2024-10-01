module Base.List.split-at-element where

open import Base.List.List
open import Base.Pair.Pair
open import Base.Bool.Bool
open import Base.Function.case
open import Base.List.split-first

-- Splits a list at the first occurrence of the given element, removing that element.
-- - eq: An equality function for the element type.
-- - x: The element to split at.
-- - xs: The input list.
-- = A pair of lists: the part before the split element and the part after (excluding the split element).
split-at-element : ∀ {A : Set} → (A → A → Bool) → A → List A → Pair (List A) (List A)
split-at-element eq x = split-first (eq x)
