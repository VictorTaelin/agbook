module Base.OrdMap.values where

import Base.AVLTree.values as AVL
open import Base.List.List
open import Base.OrdMap.OrdMap

-- Extracts all values from an OrdMap.
-- - map: The OrdMap to extract values from.
-- = A list containing all values from the map.
values : ∀ {K V : Set} → OrdMap K V → List V
values = AVL.values

