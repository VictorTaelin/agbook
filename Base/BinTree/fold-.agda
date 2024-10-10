module Base.BinTree.fold- where

open import Base.BinTree.BinTree
open import Base.BinTree.fold
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Nat.max
open import Base.Bool.Bool
open import Base.Bool.or

-- Tests the fold function on various BinTree structures.

-- Test: Folding a leaf tree.
T0 : fold (λ x l r → x + l + r) 0 Leaf ≡ 0
T0 = refl

-- Test: Folding a simple tree with addition.
T1 : fold (λ x l r → x + l + r) 0 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 6
T1 = refl

-- Test: Folding a tree with boolean OR operation.
T2 : fold (λ x l r → x || l || r) False (Node True (Node False Leaf Leaf) (Node False Leaf Leaf)) ≡ True
T2 = refl

-- Test: Folding a more complex tree with addition.
T3 : fold (λ x l r → x + l + r) 0 (Node 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 5 Leaf Leaf)) ≡ 15
T3 = refl

-- Test: Folding a tree with multiplication.
T4 : fold (λ x l r → x * l * r) 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) ≡ 24
T4 = refl

-- Test: Folding a tree to find the maximum value.
T5 : fold (λ x l r → max x (max l r)) 0 (Node 5 (Node 3 (Node 7 Leaf Leaf) Leaf) (Node 2 Leaf (Node 6 Leaf Leaf))) ≡ 7
T5 = refl
