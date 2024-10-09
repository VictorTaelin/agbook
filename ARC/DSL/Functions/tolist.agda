module ARC.DSL.Functions.tolist where

open import ARC.DSL.Types.Container.Container
open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.OrdSet.OrdSet
import ARC.DSL.Types.OrdSet.Functions as S

-- Converts a Container to a List
-- - container: The input Container
-- = A List containing all elements from the Container
tolist : ∀ {A : Set} → OrdSet A → List A
tolist xs = S.to-list xs

