module Base.OrdMap.keys where

import Base.TreeAVL.keys as AVL
open import Base.List.Type
open import Base.OrdMap.Type

-- Extracts all keys from an OrdMap.
-- - map: The OrdMap to extract keys from.
-- = A list containing all keys from the map.
keys : ∀ {K V : Set} -> OrdMap K V -> List K
keys = AVL.keys
