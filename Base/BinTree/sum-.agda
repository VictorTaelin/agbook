module Base.BinTree.sum- where

open import Base.BinTree.BinTree
open import Base.BinTree.sum
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Equal.Equal

-- Test: Sum of an empty tree.
T0 : sum Leaf ≡ 0
T0 = refl

-- Test: Sum of a tree with a single node.
T1 : sum (Node 5 Leaf Leaf) ≡ 5
T1 = refl

-- Test: Sum of a balanced tree.
T2 : sum (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 6
T2 = refl

-- Test: Sum of an unbalanced tree.
T3 : sum (Node 1 (Node 2 (Node 3 Leaf Leaf) Leaf) Leaf) ≡ 6
T3 = refl

-- Test: Sum of a larger tree.
T4 : sum (Node 10 (Node 5 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 15 (Node 12 Leaf Leaf) (Node 18 Leaf Leaf))) ≡ 65
T4 = refl

-- Test: Equivalence of sum and sum.
T5 : ∀ (t : BinTree Nat) → sum t ≡ sum t
T5 Leaf = refl
T5 (Node x l r) rewrite T5 l | T5 r = refl

-- Test: Sum of a tree with negative numbers (represented as large natural numbers)
T6 : sum (Node 0 (Node 1 Leaf Leaf) (Node 2 Leaf Leaf)) ≡ 3
T6 = refl

-- Test: Sum of a tree with repeated values
T7 : sum (Node 1 (Node 1 (Node 1 Leaf Leaf) (Node 1 Leaf Leaf)) (Node 1 (Node 1 Leaf Leaf) (Node 1 Leaf Leaf))) ≡ 7
T7 = refl
