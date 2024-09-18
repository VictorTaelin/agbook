module Data.AVLTree.singleton where

open import Data.AVLTree.Type
open import Data.AVLTree.Balance.Type

-- Creates a singleton AVL tree with one element.
-- - x: The value to be stored in the tree.
-- = An AVL tree containing only the given value.
singleton : ∀ {A : Set} → A → AVLTree A
singleton x = Node x zero Leaf Leaf
