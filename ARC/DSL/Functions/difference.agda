module ARC.DSL.Functions.difference where

open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Ord

-- Computes the difference between two OrdSets.
-- - a: The first OrdSet.
-- - b: The second OrdSet.
-- = A new OrdSet containing elements in 'a' that are not in 'b'.
difference : ∀ {A : Set} {{_ : Ord A}} → OrdSet A → OrdSet A → OrdSet A
difference = S.difference
