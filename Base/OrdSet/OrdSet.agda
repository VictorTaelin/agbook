module Base.OrdSet.OrdSet where

open import Base.AVLTree.AVLTree
open import Base.Unit.Unit

-- OrdSet is a type alias for AVL trees with Unit as the value type.
-- It represents an ordered set Base structure.
-- - V: The type of elements in the set.
-- The underlying implementation uses an AVL tree for efficient
-- insertion, deletion, and lookup operations.
OrdSet : (V : Set) → Set
OrdSet V = AVLTree V Unit

