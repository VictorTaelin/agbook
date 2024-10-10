module Base.BinTree.left- where

open import Base.BinTree.BinTree
open import Base.BinTree.left
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: Left of a leaf is None
T0 : left {Nat} Leaf ≡ None
T0 = refl

-- Test: Left of a node with left child returns Some of that child
T1 : left (Node 1 (Node 2 Leaf Leaf) Leaf) ≡ Some (Node 2 Leaf Leaf)
T1 = refl

-- Test: Left of a node with only right child still returns None for left
T2 : left (Node 1 Leaf (Node 3 Leaf Leaf)) ≡ Some Leaf
T2 = refl
