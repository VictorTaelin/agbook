module ARC.DSL.Functions.papply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Container.Functions
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.List.Functions
open import ARC.DSL.Functions.container-to-list

-- Applies a function to pairs of elements from two containers.
-- - A: The type of elements in the first container.
-- - B: The type of elements in the second container.
-- - C: The type of elements in the resulting container.
-- - fn: The function to be applied to each pair of elements.
-- - ca: The first input container.
-- - cb: The second input container.
-- = A new container with the function applied to pairs of elements from ca and cb.
papply : ∀ {A B C : Set} → (A → B → C) → Container A → Container B → Container C
papply fn ca cb = AsList (zip-with fn (container-to-list ca) (container-to-list cb))

