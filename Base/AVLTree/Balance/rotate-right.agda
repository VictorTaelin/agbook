module Base.AVLTree.Balance.rotate-right where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.Balance.eq
open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.Pair.Pair

-- Performs a right rotation on an AVL tree to fix an imbalance of -2.
-- - tree: The AVL tree to rotate.
-- = A pair containing the rotated AVL tree and a boolean indicating if the height of the root stayed the same.
rotate-right : ∀ {K V : Set} -> AVLTree K V -> Pair (AVLTree K V) Bool
rotate-right (Node v1 -one (Node v2 -one ll lr) r)
  = Node v2 zero ll (Node v1 zero lr r) , False

rotate-right (Node v1 -one (Node v2 zero ll lr) r)
  = Node v2 +one ll (Node v1 -one lr r) , True

rotate-right (Node v1 -one (Node v2 +one ll (Node v3 balance lll llr)) r) 
  with balance
... | +one = Node v3 zero (Node v2 -one ll lll) (Node v1 zero llr r) , False
... | -one = Node v3 zero (Node v2 zero ll lll) (Node v1 +one llr r) , False
... | zero = Node v3 zero (Node v2 zero ll lll) (Node v1 zero llr r) , False

-- Invalid call to `rotate-right`
rotate-right tree = tree , False
