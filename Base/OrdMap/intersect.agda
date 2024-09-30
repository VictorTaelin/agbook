module Base.OrdMap.intersect where

import Base.AVLTree.intersect as AVL
open import Base.OrdMap.OrdMap
open import Base.Trait.Ord

-- Computes the intersection of two OrdMaps.
-- This function is a wrapper around the AVL tree intersect operation.
-- - K: The type of keys in the OrdMap.
-- - V: The type of values in the OrdMap.
-- - Ord K: An instance of the Ord typeclass for the key type.
-- - map₁: The first OrdMap.
-- - map₂: The second OrdMap.
-- = A new OrdMap containing only the key-value pairs present in both input maps.
intersect : ∀ {K V : Set} → {{_ : Ord K}} →
            OrdMap K V → OrdMap K V → OrdMap K V
intersect = AVL.intersect

-- Infix notation for intersecting two OrdMaps.
-- - map₁: The first OrdMap.
-- - map₂: The second OrdMap.
-- = A new OrdMap containing only the key-value pairs present in both input maps.
_∩_ : ∀ {K V : Set} → {{_ : Ord K}} →
      OrdMap K V → OrdMap K V → OrdMap K V
_∩_ = intersect

infixr 6 _∩_
