module Base.OrdSet.singleton where

import Base.AVLTree.singleton as AVL
open import Base.OrdSet.OrdSet
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.Unit.Unit

-- Creates an OrdSet containing a single element.
-- - V: The type of the element.
-- - Ord V: An instance of the Ord typeclass for the element type.
-- - value: The element to be added to the set.
-- = A new OrdSet containing only the given element.
singleton : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V
singleton value = AVL.singleton (value , unit)
