module Base.OrdMap.values where

import Base.TreeAVL.values as AVL
open import Base.List.Type
open import Base.OrdMap.Type

-- Extracts all values from an OrdMap.
-- - map: The OrdMap to extract values from.
-- = A list containing all values from the map.
values : ∀ {K V : Set} → OrdMap K V → List V
values = AVL.values
