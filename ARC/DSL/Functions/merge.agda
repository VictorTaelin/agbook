module ARC.DSL.Functions.merge where

open import ARC.DSL.Types.Container.Type
open import ARC.DSL.Types.List.Type
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.Type
import ARC.DSL.Types.OrdSet.Functions as S
open import Base.Trait.Ord

container-to-list : ∀ {A : Set} → Container A → List A
container-to-list (list l) = l
container-to-list (set  s) = S.to-list s

-- Merges a container of containers into a single container.
-- - containers: A container of containers to be merged.
-- = A new container with all elements from the input containers.
merge : ∀ {A : Set} → {{_ : Ord A}} → Container (Container A) → Container A
merge (list l) = list (L.concat-map container-to-list l)
merge (set  s) = set  (S.from-list (L.concat-map container-to-list (S.to-list s)))
