module ARC.DSL.Functions.sfilter where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

open import Base.Trait.Ord

-- Filters elements in a container that satisfy the given condition.
-- - A: The type of elements in the container.
-- - container: The input container (either a List or an OrdSet).
-- - condition: The predicate function to test each element.
-- = A new container of the same type with elements that satisfy the condition.
sfilter : ∀ {A : Set} {{_ : Ord A}} → Container A → (A → Boolean) → Container A
sfilter (AsList xs) condition = AsList (L.filter condition xs)
sfilter (AsOSet  xs) condition = AsOSet  (S.filter condition xs)

