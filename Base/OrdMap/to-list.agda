module Base.OrdMap.to-list where

import Base.AVLTree.to-list as AVL
open import Base.List.List
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.AVLTree.AVLTree

-- Converts an OrdMap to a sorted list of key-value pairs.
-- - map: The OrdMap to convert.
-- = A list containing all key-value pairs from the map in ascending order of keys.
to-list : ∀ {K V : Set} → OrdMap K V → List (Pair K V)
to-list = AVL.to-list

