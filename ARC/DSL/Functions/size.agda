module ARC.DSL.Functions.size where

open import ARC.DSL.Types.Container.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.List.Type
import ARC.DSL.Types.List.Functions as L
open import ARC.DSL.Types.OrdSet.Type
import ARC.DSL.Types.OrdSet.Functions as S

-- Calculates the size (cardinality) of a Container.
-- - container: The input Container.
-- = The number of elements in the Container.
size : ∀ {A : Set} → Container A → Integer
size (list xs) = L.length xs
size (set  xs) = S.size xs
