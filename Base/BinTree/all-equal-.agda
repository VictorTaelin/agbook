module Base.BinTree.all-equal- where

open import Base.BinTree.BinTree
open import Base.BinTree.all-equal
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq

-- Test: Empty tree is considered all equal
T0 : all-equal (Leaf {A = Nat}) ≡ True
T0 = refl

-- Test: Single node tree is all equal
T1 : all-equal (Node 5 Leaf Leaf) ≡ True
T1 = refl

-- Test: Tree with all equal values
T2 : all-equal (Node 3 (Node 3 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ True
T2 = refl

-- Test: Tree with different values
T3 : all-equal (Node 3 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) ≡ False
T3 = refl

-- Test: Larger tree with all equal values
T4 : all-equal (Node 7 (Node 7 (Node 7 Leaf Leaf) (Node 7 Leaf Leaf)) (Node 7 (Node 7 Leaf Leaf) (Node 7 Leaf Leaf))) ≡ True
T4 = refl

-- Test: Larger tree with one different value
T5 : all-equal (Node 7 (Node 7 (Node 7 Leaf Leaf) (Node 7 Leaf Leaf)) (Node 7 (Node 7 Leaf Leaf) (Node 8 Leaf Leaf))) ≡ False
T5 = refl
