module ARC.DSL.Functions.mfilter where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Container.Functions
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Functions.sfilter
open import ARC.DSL.Functions.merge

open import Base.Trait.Ord

-- Filters elements in a container and merges the results.
-- - A: The type of elements in the container.
-- - container: The input container of containers.
-- - condition: The predicate function to test each element.
-- = A new container with filtered and merged elements.
mfilter : ∀ {A : Set} {{_ : Ord A}} → Container (Container A) → (Container A → Boolean) → Container A
mfilter xs pred = merge (sfilter {{OrdContainer}} xs (λ x → pred x))

