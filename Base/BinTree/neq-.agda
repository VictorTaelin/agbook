module Base.BinTree.neq- where

open import Base.BinTree.BinTree
open import Base.BinTree.neq
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Trait.Eq
open import Base.Nat.Nat

-- Test: Inequality of two different simple trees
T0 : ((Node 1 Leaf Leaf) != (Node 2 Leaf Leaf)) ≡ True
T0 = refl

-- Test: Inequality of two identical complex trees
T1 : (Node 1 (Node 2 Leaf Leaf) Leaf != Node 1 (Node 2 Leaf Leaf) Leaf) ≡ False
T1 = refl

-- Test: Inequality of trees with same root but different structure
T2 : (Node 1 (Node 2 Leaf Leaf) Leaf != Node 1 Leaf (Node 2 Leaf Leaf)) ≡ True
T2 = refl

-- Test: Inequality between a leaf and a non-leaf tree
T3 : (Leaf != (Node 1 Leaf Leaf)) ≡ True
T3 = refl

-- Test: Inequality of two empty trees (leaves)
T4 : (Leaf != Leaf) ≡ False
T4 = refl

-- Test: Inequality of trees with different values in subtrees
T5 : (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf) != Node 1 (Node 2 Leaf Leaf) (Node 4 Leaf Leaf)) ≡ True
T5 = refl

-- Test: Inequality of trees with same structure but different root values
T6 : (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf) != Node 4 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ True
T6 = refl

-- Test: Inequality of a complex tree and a leaf
T7 : (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf) != Leaf) ≡ True
T7 = refl
