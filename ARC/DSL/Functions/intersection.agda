module ARC.DSL.Functions.intersection where

open import ARC.DSL.Types.OrdSet.Type
import Base.OrdSet.intersect as S

open import Base.Trait.Ord

-- Computes the intersection of two OrdSets.
-- - s1: The first OrdSet.
-- - s2: The second OrdSet.
-- = A new OrdSet containing only the elements present in both input sets.
intersection : ∀ {A : Set} {{_ : Ord A}} →  OrdSet A → OrdSet A → OrdSet A
intersection = S._∩_
