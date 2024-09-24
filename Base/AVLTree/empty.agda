module Base.AVLTree.empty where

open import Base.AVLTree.Balance.Type
open import Base.AVLTree.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {K V : Set} -> AVL K V
empty = Leaf
