module Base.BinTree.value- where

open import Base.BinTree.BinTree
open import Base.BinTree.value
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: value of a leaf node is None
T0 : value {Nat} Leaf ≡ None
T0 = refl

-- Test: value of a node with content 5 is (Some 5)
T1 : value (Node 5 Leaf Leaf) ≡ Some 5
T1 = refl

-- Test: value of a complex tree returns the root node's value
T2 : value (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ Some 1
T2 = refl
