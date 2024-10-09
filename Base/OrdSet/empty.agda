module Base.OrdSet.empty where

import Base.AVLTree.empty as AVL
open import Base.OrdSet.OrdSet

-- Creates an empty OrdSet.
-- = An empty OrdSet.
empty : ∀ {V : Set} → OrdSet V
empty = AVL.empty

