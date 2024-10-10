module Base.BinTree.foldl- where

open import Base.BinTree.BinTree
open import Base.BinTree.foldl
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Equal.Equal

-- Test: Empty tree
T0 : foldl add 0 Leaf ≡ 0
T0 = refl

-- Test: Single node tree
T1 : foldl add 0 (Node 5 Leaf Leaf) ≡ 5
T1 = refl

-- Test: Tree with multiple nodes
T2 : foldl add 0 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 6
T2 = refl

-- Test: Using multiplication instead of addition
T3 : foldl mul 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) ≡ 24
T3 = refl

-- Test: Using a more complex tree structure
T4 : foldl add 0 (Node 1 (Node 2 (Node 3 Leaf Leaf) Leaf) (Node 4 Leaf (Node 5 Leaf Leaf))) ≡ 15
T4 = refl
