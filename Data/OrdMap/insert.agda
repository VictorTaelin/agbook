module Data.OrdMap.insert where

open import Data.AVL.Type
import Data.AVL.insert as AVL
open import Data.OrdMap.Type
open import Data.Pair.Type
open import Data.Trait.Ord

-- Inserts a key-value pair into an OrdMap.
-- This function is a wrapper around the AVL tree insert operation.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - Ord K: An instance of the Ord typeclass for the key type.
-- - pair: The key-value pair to be inserted into the OrdMap.
-- - map: The OrdMap to insert into.
-- = A new OrdMap with the specified key-value pair inserted or updated.
insert : ∀ {K V : Set} → {{_ : Ord K}} →
         Pair K V → OrdMap K V → OrdMap K V
insert = AVL.insert
