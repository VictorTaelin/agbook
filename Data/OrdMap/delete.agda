module Data.OrdMap.delete where

open import Data.AVL.Type
import Data.AVL.delete as T
open import Data.OrdMap.Type
open import Data.Pair.Type
open import Data.Trait.Ord

-- Deletes a key-value pair from an OrdMap.
-- This function is a wrapper around the AVL tree delete operation.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - key: The key to be deleted from the OrdMap.
-- - map: The OrdMap to delete from.
-- = A new OrdMap with the specified key-value pair removed (if it existed).
delete : ∀ {K V : Set} → {{_ : Ord K}} → K → OrdMap K V → OrdMap K V
delete = T.delete
