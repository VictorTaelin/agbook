module Base.AVLTree.AVLTree where

open import Base.Pair.Pair
open import Base.AVLTree.Balance.Balance

-- Defines an AVL tree datatype.
-- - K: The type of keys stored in the tree.
-- - V: The type of values stored in the tree.
data AVLTree (K V : Set) : Set where
  Leaf : AVLTree K V
  Node : (key-value : Pair K V) → (balance : Balance) → (left : AVLTree K V) → (right : AVLTree K V) → AVLTree K V

