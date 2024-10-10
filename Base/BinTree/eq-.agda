module Base.BinTree.eq- where

open import Base.BinTree.BinTree
open import Base.BinTree.eq
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq

-- Tests the equality function for various BinTree scenarios.

-- Test: Equality of two identical simple trees.
T0 : ((Node 1 Leaf Leaf) == (Node 1 Leaf Leaf)) ≡ True
T0 = refl

-- Test: Equality of two identical complex trees.
T1 : (Node 1 (Node 2 Leaf Leaf) Leaf == Node 1 (Node 2 Leaf Leaf) Leaf) ≡ True
T1 = refl

-- Test: Inequality of trees with different root values.
T2 : ((Node 1 Leaf Leaf) == Node 2 Leaf Leaf) ≡ False
T2 = refl

-- Test: Inequality between a leaf and a non-leaf tree.
T3 : (Leaf == (Node 1 Leaf Leaf)) ≡ False
T3 = refl

-- Test: Equality of two empty trees (leaves).
T4 : (Leaf == Leaf) ≡ True
T4 = refl

-- Test: Inequality of trees with same root but different structure.
T5 : (Node 1 (Node 2 Leaf Leaf) Leaf == Node 1 Leaf (Node 2 Leaf Leaf)) ≡ False
T5 = refl

-- Test: Equality of trees with nested structures.
T6 : (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 4 Leaf Leaf) == 
      Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 4 Leaf Leaf)) ≡ True
T6 = refl

-- Test: Inequality of trees with different values in deep structures.
T7 : (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 4 Leaf Leaf) == 
      Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 5 Leaf Leaf)) ≡ False
T7 = refl

-- Test: Equality of trees with multiple levels and identical structure
T8 : (Node 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 6 Leaf Leaf) Leaf) ==
      Node 1 (Node 2 (Node 3 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 5 (Node 6 Leaf Leaf) Leaf)) ≡ True
T8 = refl

-- Test: Inequality of trees with same structure but different leaf values
T9 : (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf) ==
      Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf (Node 4 Leaf Leaf))) ≡ False
T9 = refl
