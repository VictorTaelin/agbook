module Base.OrdSet.empty where

import Base.AVLTree.empty as AVL
open import Base.OrdSet.Type

-- Creates an empty OrdSet.
-- = An empty OrdSet.
empty : ∀ {V : Set} -> OrdSet V
empty = AVL.empty
