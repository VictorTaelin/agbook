module Base.BinTree.foldr- where

open import Base.BinTree.BinTree
open import Base.BinTree.foldr
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Nat.sub
open import Base.Equal.Equal

-- Test: Empty tree
T0 : foldr add 0 Leaf ≡ 0
T0 = refl

-- Test: Single node tree
T1 : foldr add 0 (Node 5 Leaf Leaf) ≡ 5
T1 = refl

-- Test: Tree with multiple nodes
T2 : foldr add 0 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 6
T2 = refl

-- Test: Using multiplication instead of addition
T3 : foldr mul 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) ≡ 24
T3 = refl

-- Test: Using a more complex tree structure
T4 : foldr add 0 (Node 1 (Node 2 (Node 3 Leaf Leaf) Leaf) (Node 4 Leaf (Node 5 Leaf Leaf))) ≡ 15
T4 = refl

-- Test: Right-associative nature of foldr
T5 : foldr sub 0 (Node 10 (Node 5 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 8
T5 = refl

-- Test: Using foldr to count nodes
T6 : foldr (λ _ acc → Succ acc) 0 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf (Node 4 Leaf Leaf))) ≡ 4
T6 = refl
