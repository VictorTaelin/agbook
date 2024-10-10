module Base.BinTree.length- where

open import Base.BinTree.BinTree
open import Base.BinTree.length
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Equal.Equal

-- Test: Length of an empty tree is zero
T0 : length (Leaf {Nat}) ≡ 0
T0 = refl

-- Test: Length of a single node tree is one
T1 : length (Node 1 Leaf Leaf) ≡ 1
T1 = refl

-- Test: Length of a tree with three nodes
T2 : length (Node 1 (Node 2 Leaf Leaf) Leaf) ≡ 2
T2 = refl

-- Test: Length of a balanced tree with seven nodes
T3 : length (Node 1 
              (Node 2 (Node 4 Leaf Leaf) (Node 5 Leaf Leaf))
              (Node 3 (Node 6 Leaf Leaf) (Node 7 Leaf Leaf))) 
     ≡ 7
T3 = refl
