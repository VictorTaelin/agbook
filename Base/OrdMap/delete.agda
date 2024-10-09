module Base.OrdMap.delete where

import Base.AVLTree.delete as T
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Deletes a key-value pair from an OrdMap.
-- This function is a wrapper around the AVL tree delete operation.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - key: The key to be deleted from the OrdMap.
-- - map: The OrdMap to delete from.
-- = A new OrdMap with the specified key-value pair removed (if it existed).
delete : ∀ {K V : Set} → {{_ : Ord K}} → K → OrdMap K V → OrdMap K V
delete = T.delete

