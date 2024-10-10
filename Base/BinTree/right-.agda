module Base.BinTree.right- where

open import Base.BinTree.BinTree
open import Base.BinTree.right
open import Base.Maybe.Maybe
open import Base.Equal.Equal
open import Base.Nat.Nat

-- Test: Right of a leaf is None.
T0 : right {Nat} Leaf ≡ None
T0 = refl

-- Test: Right of a node with right child returns Some of that child.
T1 : right (Node 1 Leaf (Node 3 Leaf Leaf)) ≡ Some (Node 3 Leaf Leaf)
T1 = refl

-- Test: Right of a node with only left child still returns Some leaf for right.
T2 : right (Node 1 (Node 2 Leaf Leaf) Leaf) ≡ Some Leaf
T2 = refl

-- Test: Right of a complex tree returns the correct right subtree.
T3 : right (Node 1 (Node 2 Leaf Leaf) (Node 3 (Node 4 Leaf Leaf) (Node 5 Leaf Leaf))) ≡ Some (Node 3 (Node 4 Leaf Leaf) (Node 5 Leaf Leaf))
T3 = refl

-- Test: Right of a single node tree with no children returns Some leaf.
T4 : right (Node 1 Leaf Leaf) ≡ Some Leaf
T4 = refl
