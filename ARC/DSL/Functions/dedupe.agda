module ARC.DSL.Functions.dedupe where

open import ARC.DSL.Types.Container.Container
open import Base.Trait.Ord

-- Removes duplicate elements from a container.
-- - xs: The input container.
-- = A new container with duplicate elements removed, maintaining the original order of first occurrence.
dedupe : ∀ {A : Set} {{_ : Ord A}} → Container A → Container A
dedupe (AsList l) = AsList (L.dedup l)
dedupe (AsOSet s) = AsOSet s
dedupe (AsPair p) = AsList (L.dedup (P.to-list p))
