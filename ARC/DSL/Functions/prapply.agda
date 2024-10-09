module ARC.DSL.Functions.prapply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Container.Functions
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.List.List
open import ARC.DSL.Functions.container-to-list
import ARC.DSL.Types.OrdSet.Functions as S
import ARC.DSL.Types.List.Functions as L

open import Base.Trait.Ord

-- Applies a function to the Cartesian product of elements from two containers.
-- - A: The type of elements in the first container.
-- - B: The type of elements in the second container.
-- - C: The type of elements in the resulting container.
-- - fn: The function to be applied to each pair of elements.
-- - ca: The first input container.
-- - cb: The second input container.
-- = A new container (OrdSet) with the function applied to all pairs of elements from ca and cb.
prapply : ∀ {A B C : Set} {{_ : Ord C}} → (A → B → C) → Container A → Container B → Container C
prapply fn ca cb = AsList (L.concat-map (λ a → L.map (fn a) (container-to-list cb)) (container-to-list ca))

