module ARC.DSL.Functions.merge where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S
open import ARC.DSL.Functions.container-to-list
open import Base.Trait.Ord

-- Merges a container of containers into a single container.
-- - containers: A container of containers to be merged.
-- = A new container with all elements from the input containers.
merge : ∀ {A : Set} → {{_ : Ord A}} → Container (Container A) → Container A
merge (AsList l) = AsList (L.concat-map container-to-list l)
merge (AsOSet  s) = AsOSet  (S.from-list (L.concat-map container-to-list (S.to-list s)))

