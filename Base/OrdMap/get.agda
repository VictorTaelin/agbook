module Base.OrdMap.get where

import Base.AVLTree.get as AVL
open import Base.Maybe.Maybe
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.Trait.Ord

-- Retrieves the value associated with a given key in the OrdMap.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - Ord K: An instance of the Ord typeclass for the key type.
-- - key: The key to look up.
-- - map: The OrdMap to search in.
-- = Maybe V, where:
--   - Some v if the key is found with associated value v
--   - None if the key is not found in the map
get : ∀ {K V : Set} → {{_ : Ord K}} → K → OrdMap K V → Maybe V
get = AVL.get
