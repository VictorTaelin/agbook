module Base.BinTree.show- where

open import Base.BinTree.BinTree
open import Base.BinTree.show
open import Base.Equal.Equal
open import Base.Nat.Trait.Show
open import Base.Nat.Nat
open import Base.String.String

-- Tests the string representation of an empty binary tree of natural numbers.
T0 : show (Leaf {A = Nat}) ≡ "_"
T0 = refl

-- Tests the string representation of a complex binary tree of natural numbers.
T1 : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ "{2, {1, _, _}, {3, _, _}}"
T1 = refl

-- Tests the string representation of a single-node binary tree of natural numbers.
T2 : show (Node 5 Leaf Leaf) ≡ "{5, _, _}"
T2 = refl

-- Tests the string representation of an unbalanced binary tree of natural numbers.
T3 : show (Node 4 (Node 2 (Node 1 Leaf Leaf) Leaf) Leaf) ≡ "{4, {2, {1, _, _}, _}, _}"
T3 = refl

-- Test: Right-heavy unbalanced tree
T4 : show (Node 1 Leaf (Node 2 Leaf (Node 3 Leaf Leaf))) ≡ "{1, _, {2, _, {3, _, _}}}"
T4 = refl

-- Test: Tree with zero values
T5 : show (Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf Leaf)) ≡ "{0, {0, _, _}, {0, _, _}}"
T5 = refl
