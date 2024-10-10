module Base.BinTree.node- where

open import Base.BinTree.BinTree
open import Base.BinTree.node
open import Base.BinTree.leaf
open import Base.Equal.Equal
open import Base.Nat.Nat

-- Test: Create a simple node with two leaf children
T0 : node 1 leaf leaf ≡ Node 1 Leaf Leaf
T0 = refl

-- Test: Create a node with a left child
T1 : node 2 (node 1 leaf leaf) leaf ≡ Node 2 (Node 1 Leaf Leaf) Leaf
T1 = refl

-- Test: Create a node with a right child
T2 : node 3 leaf (node 4 leaf leaf) ≡ Node 3 Leaf (Node 4 Leaf Leaf)
T2 = refl

-- Test: Create a balanced tree with three levels
T3 : node 1 (node 2 leaf leaf) (node 3 leaf leaf) ≡ Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)
T3 = refl
