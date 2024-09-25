module Base.OrdSet.to-list where

import Base.AVLTree.keys as AVL
open import Base.List.Type
open import Base.OrdSet.Type
open import Base.Pair.Type

-- Extracts all elements from an OrdSet into a list.
-- - set: The OrdSet to extract elements from.
-- = A list containing all elements from the set.
to-list : ∀ {V : Set} -> OrdSet V -> List V
to-list set = AVL.keys set
