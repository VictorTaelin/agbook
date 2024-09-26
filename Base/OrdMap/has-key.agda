module Base.OrdMap.has-key where

import Base.AVLTree.has-key as AVL
open import Base.Bool.Bool
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Checks if a key exists in the OrdMap.
-- - key: The key to search for.
-- - map: The OrdMap to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} -> {{_ : Ord K}} -> K -> OrdMap K V -> Bool
has-key = AVL.has-key
