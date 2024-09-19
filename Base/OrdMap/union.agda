module Base.OrdMap.union where

open import Base.OrdMap.Type
open import Base.AVL.Type
import Base.AVL.union as AVL
open import Base.Pair.Type
open import Base.Trait.Ord

-- Computes the union of two OrdMaps.
-- This function uses the AVL fold operation to insert all elements
-- from the second map into the first map.
-- - map1: The first OrdMap.
-- - map2: The second OrdMap.
-- = A new OrdMap containing all key-value pairs from both input maps,
--   with values from map2 taking precedence in case of key conflicts.
union : ∀ {K V : Set} → {{_ : Ord K}} →
        OrdMap K V → OrdMap K V → OrdMap K V
union = AVL.union
