module ARC.DSL.Functions.apply where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.OrdSet.OrdSet
open import ARC.DSL.Types.List.List

import ARC.DSL.Types.OrdSet.Functions as S
import ARC.DSL.Types.List.Functions as L

open import Base.Trait.Ord

-- Applies a function to each element in a container.
-- - fn: The function to be applied to each element.
-- - c: The container of elements.
-- = A new container with the function applied to all elements.
apply : ∀ {A B : Set} {{_ : Ord B}} → (A → B) → Container A → Container B
apply fn (ListC xs) = ListC (L.map fn xs)
apply fn (SetC xs)  = SetC  (S.map fn xs)
