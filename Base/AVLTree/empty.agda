module Base.AVLTree.empty where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.AVLTree

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {K V : Set} -> AVLTree K V
empty = Leaf
