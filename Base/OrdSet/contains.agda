module Base.OrdSet.contains where

import Base.AVLTree.has-key as AVL
open import Base.Bool.Bool
open import Base.OrdSet.OrdSet
open import Base.Trait.Ord

-- Checks if an element is present in the OrdSet.
-- - elem: The element to search for.
-- - set: The OrdSet to search in.
-- = True if the element is found, False otherwise.
contains : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V → Bool
contains = AVL.has-key

