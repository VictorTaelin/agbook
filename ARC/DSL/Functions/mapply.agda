module ARC.DSL.Functions.mapply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Container.Functions
open import ARC.DSL.Functions.apply
open import ARC.DSL.Functions.merge

open import Base.Trait.Ord

-- Applies a function to each container in a container of containers and merges the results.
-- - A: The type of elements in the inner containers.
-- - B: The type of elements in the resulting container.
-- - fn: The function to be applied to each inner container.
-- - container: The input container of containers.
-- = A new container with the function applied to all inner containers and merged.
mapply : ∀ {A B : Set} {{_ : Ord B}} → (Container A → Container B) → Container (Container A) → Container B
mapply fn container = merge (apply {{OrdContainer}} fn container)

