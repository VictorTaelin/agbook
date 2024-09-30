module Base.OrdMap.difference where

import Base.AVLTree.difference as AVL
open import Base.OrdMap.OrdMap
open import Base.Trait.Ord

-- Computes the difference between two OrdMaps.
-- - m1: The first OrdMap.
-- - m2: The second OrdMap.
-- = A new OrdMap containing key-value pairs from m1 that are not present in m2.
difference : ∀ {K V : Set} → {{_ : Ord K}} → OrdMap K V → OrdMap K V → OrdMap K V
difference = AVL.difference

-- Infix notation for the difference of two OrdMaps.
-- - m1: The first OrdMap.
-- - m2: The second OrdMap.
-- = A new OrdMap containing key-value pairs from m1 that are not present in m2.
_∖_ : ∀ {K V : Set} → {{_ : Ord K}} → OrdMap K V → OrdMap K V → OrdMap K V
_∖_ = difference

infixr 6 _∖_
