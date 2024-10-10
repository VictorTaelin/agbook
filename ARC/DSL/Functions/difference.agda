module ARC.DSL.Functions.difference where

open import ARC.DSL.Types.Container.Container

open import Base.Trait.Ord

-- Computes the difference between two containers.
-- - a: The first container.
-- - b: The second container.
-- = A new OrdSet containing elements in 'a' that are not in 'b'.
difference : ∀ {A : Set} {{_ : Ord A}} → Container A → Container A → Container A
difference (AsOSet s1) (AsOSet s2) = AsOSet (O.difference s1 s2)
difference (AsList s1) (AsList s2) = AsList (L.difference s1 s2)

