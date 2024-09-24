module Base.OrdMap.empty where

import Base.AVLTree.empty as AVL
open import Base.OrdMap.Type

-- Creates an empty OrdMap.
-- = An empty OrdMap.
empty : ∀ {K V : Set} -> OrdMap K V
empty = AVL.empty
