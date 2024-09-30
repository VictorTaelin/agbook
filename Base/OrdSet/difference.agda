module Base.OrdSet.difference where

import Base.AVLTree.difference as AVL
open import Base.OrdSet.OrdSet
open import Base.Trait.Ord

-- Computes the difference between two OrdSets.
-- - s1: The first OrdSet.
-- - s2: The second OrdSet.
-- = A new OrdSet containing elements from s1 that are not present in s2.
difference : ∀ {V : Set} {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
difference = AVL.difference

-- Infix notation for the difference of two OrdSets.
-- - s₁: The first OrdSet.
-- - s₂: The second OrdSet.
-- = A new OrdSet containing elements from s₁ that are not present in s₂.
_∖_ : ∀ {V : Set} {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
_∖_ = difference

infixr 6 _∖_
