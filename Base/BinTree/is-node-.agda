module Base.BinTree.is-node- where

open import Base.BinTree.BinTree
open import Base.BinTree.is-node
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: is-node on a leaf
T0 : is-node {Nat} (Leaf) ≡ False
T0 = refl

-- Test: is-node on a simple node
T1 : is-node (Node 5 Leaf Leaf) ≡ True
T1 = refl

-- Test: is-node on a more complex tree
T2 : is-node (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ True
T2 = refl
