module Base.OrdMap.get-pair where

import Base.AVLTree.get-pair as AVL
open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Retrieves a key-value pair from the OrdMap based on the given key.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - Ord K: An instance of the Ord typeclass for the key type.
-- - key: The key to search for.
-- - map: The OrdMap to search in.
-- = Maybe (Pair K V), where:
--   - Some (key, value) if the key is found with its associated value
--   - None if the key is not found in the map
get-pair : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> OrdMap K V -> Maybe (Pair K V)
get-pair = AVL.get-pair
