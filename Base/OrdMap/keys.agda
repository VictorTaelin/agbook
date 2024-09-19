module Base.OrdMap.keys where

open import Base.OrdMap.Type
open import Base.List.Type
import Base.AVL.keys as AVL

-- Extracts all keys from an OrdMap.
-- - map: The OrdMap to extract keys from.
-- = A list containing all keys from the map.
keys : ∀ {K V : Set} → OrdMap K V → List K
keys = AVL.keys
