module Data.AVLTree.empty where

open import Data.AVLTree.Type
open import Data.AVLTree.Balance.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {A : Set} → AVLTree A
empty = Leaf
