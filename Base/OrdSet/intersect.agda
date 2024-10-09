module Base.OrdSet.intersect where

import Base.AVLTree.intersect as AVL
open import Base.OrdSet.OrdSet
open import Base.Trait.Ord

-- Computes the intersection of two OrdSets.
-- - s₁: The first OrdSet.
-- - s₂: The second OrdSet.
-- = A new OrdSet containing only the elements present in both input sets.
intersect : ∀ {V : Set} → {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
intersect = AVL.intersect

-- Infix notation for intersecting two OrdSets.
-- - s₁: The first OrdSet.
-- - s₂: The second OrdSet.
-- = A new OrdSet containing only the elements present in both input sets.
_∩_ : ∀ {V : Set} → {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
_∩_ = intersect

infixr 6 _∩_

