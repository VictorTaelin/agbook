module ARC.DSL.Functions.dedupe where

open import ARC.DSL.Types.List.Type
import ARC.DSL.Types.List.Functions as L
open import Base.Trait.Ord

-- Removes duplicate elements from a list.
-- - xs: The input list.
-- = A new list with duplicate elements removed, maintaining the original order of first occurrence.
dedupe : ∀ {A : Set} {{_ : Ord A}} → List A → List A
dedupe = L.dedup
