module Base.BinTree.count- where

open import Base.BinTree.BinTree
open import Base.BinTree.count
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Equal.Equal
open import Base.Nat.Trait.Eq

-- Test: Count in an empty tree.
T0 : count 5 Leaf ≡ 0
T0 = refl

-- Test: Count in a tree with one matching element.
T1 : count 5 (Node 5 Leaf Leaf) ≡ 1
T1 = refl

-- Test: Count in a tree with multiple matching elements.
T2 : count 5 (Node 5 (Node 5 Leaf Leaf) (Node 3 Leaf (Node 5 Leaf Leaf))) ≡ 3
T2 = refl

-- Test: Count in a tree with no matching elements.
T3 : count 7 (Node 5 (Node 3 Leaf Leaf) (Node 1 Leaf (Node 9 Leaf Leaf))) ≡ 0
T3 = refl

-- Test: Count in a balanced tree with mixed elements.
T4 : count 2 (Node 1 (Node 2 Leaf Leaf) (Node 3 (Node 2 Leaf Leaf) (Node 4 Leaf Leaf))) ≡ 2
T4 = refl

-- Test: Count in a left-heavy tree.
T5 : count 1 (Node 1 (Node 1 (Node 1 Leaf Leaf) Leaf) Leaf) ≡ 3
T5 = refl

-- Test: Count in a right-heavy tree.
T6 : count 3 (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf (Node 3 Leaf Leaf)))) ≡ 2
T6 = refl
