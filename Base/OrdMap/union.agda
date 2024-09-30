module Base.OrdMap.union where

import Base.AVLTree.union as AVL
open import Base.OrdMap.OrdMap
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.AVLTree.AVLTree

-- Computes the union of two OrdMaps.
-- This function uses the AVLTree fold operation to insert all elements
-- from the second map into the first map.
-- - map1: The first OrdMap.
-- - map2: The second OrdMap.
-- = A new OrdMap containing all key-value pairs from both input maps,
--   with values from map2 taking precedence in case of key conflicts.
union : ∀ {K V : Set} → {{_ : Ord K}} →
        OrdMap K V → OrdMap K V → OrdMap K V
union = AVL.union
