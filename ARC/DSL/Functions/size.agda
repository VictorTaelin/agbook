module ARC.DSL.Functions.size where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.List.List
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

-- Calculates the size (cardinality) of a Container.
-- - container: The input Container.
-- = The number of elements in the Container.
size : ∀ {A : Set} → Container A → Integer
size (AsList xs) = L.length xs
size (AsOSet  xs) = S.size xs
