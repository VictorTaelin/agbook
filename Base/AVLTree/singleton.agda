module Base.AVLTree.singleton where

open import Base.Pair.Pair
open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.AVLTree

-- Creates a singleton AVL tree with one element.
-- - x: The value to be stored in the tree.
-- = An AVL tree containing only the given value.
singleton : ∀ {K V : Set} → Pair K V → AVLTree K V
singleton p = Node p zero Leaf Leaf
