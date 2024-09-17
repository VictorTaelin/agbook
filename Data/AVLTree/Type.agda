module Data.AVLTree.Type where

open import Data.AVLTree.Balance.Type

-- Defines an AVL tree datatype.
-- - A: The type of values stored in the tree.
data AVLTree (A : Set) : Set where
  Leaf : AVLTree A
  Node : (value : A) → (balance : Balance) → (left : AVLTree A) → (right : AVLTree A) → AVLTree A
