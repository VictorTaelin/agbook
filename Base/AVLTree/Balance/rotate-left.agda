module Base.AVLTree.Balance.rotate-left where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.Balance.eq
open import Base.AVLTree.AVLTree
open import Base.AVLTree.empty
open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.Pair.Pair

-- Performs a left rotation on an AVL tree to fix an imbalance of +2.
-- - tree: The AVL tree to rotate.
-- = A pair containing the rotated AVL tree and a boolean indicating if the height of the root stayed the same.
rotate-left : ∀ {K V : Set} → AVLTree K V → Pair (AVLTree K V) Bool
rotate-left (Node v1 +one l (Node v2 +one rl rr))
  = Node v2 zero (Node v1 zero l rl) rr , False

rotate-left (Node v1 +one l (Node v2 zero rl rr))
  = Node v2 -one (Node v1 +one l rl) rr , True

rotate-left (Node v1 +one l (Node v2 -one (Node v3 balance rll rlr) rr))
  with balance
... | +one = Node v3 zero (Node v1 -one l rll) (Node v2 zero rlr rr) , False
... | -one = Node v3 zero (Node v1 zero l rll) (Node v2 +one rlr rr) , False
... | zero = Node v3 zero (Node v1 zero l rll) (Node v2 zero rlr rr) , False

-- Invalid call to `rotate-left`
rotate-left tree = tree , False

