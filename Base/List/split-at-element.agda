module Base.List.split-at-element where

open import Base.List.Type
open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Function.case
open import Base.List.split

-- Splits a list at the first occurrence of the given element, removing that element.
-- - eq: An equality function for the element type.
-- - x: The element to split at.
-- - xs: The input list.
-- = A pair of lists: the part before the split element and the part after (excluding the split element).
split-at-element : ∀ {A : Set} → (A → A → Bool) → A → List A → Pair (List A) (List A)
split-at-element eq x = split (eq x)
