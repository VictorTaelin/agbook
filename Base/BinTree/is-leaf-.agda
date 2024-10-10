module Base.BinTree.is-leaf- where

open import Base.BinTree.BinTree
open import Base.BinTree.is-leaf
open import Base.Bool.Bool
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: is-leaf on a leaf.
T0 : is-leaf {Nat} (Leaf) ≡ True
T0 = refl

-- Test: is-leaf on a simple node.
T1 : is-leaf (Node 5 Leaf Leaf) ≡ False
T1 = refl

-- Test: is-leaf on a more complex tree.
T2 : is-leaf (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ False
T2 = refl

-- Test: is-leaf on a left-heavy tree
T3 : is-leaf (Node 1 (Node 2 Leaf Leaf) Leaf) ≡ False
T3 = refl

-- Test: is-leaf on a right-heavy tree
T4 : is-leaf (Node 1 Leaf (Node 3 Leaf Leaf)) ≡ False
T4 = refl
