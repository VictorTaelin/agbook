module Base.BinTree.merge- where

open import Base.BinTree.BinTree
open import Base.BinTree.merge
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.max
open import Base.Nat.mul
open import Base.Function.id
open import Base.Bool.Bool
open import Base.Bool.if

-- Test: Merging two empty trees.
T0 : merge id id add Leaf Leaf ≡ Leaf
T0 = refl

-- Test: Merging an empty tree with a non-empty tree.
T1 : merge id id add Leaf (Node 5 Leaf Leaf) ≡ Node 5 Leaf Leaf
T1 = refl

-- Test: Merging a non-empty tree with an empty tree.
T2 : merge id id add (Node 3 Leaf Leaf) Leaf ≡ Node 3 Leaf Leaf
T2 = refl

-- Test: Merging two non-empty trees.
T3 : merge id id add (Node 2 Leaf Leaf) (Node 3 Leaf Leaf) ≡ Node 5 Leaf Leaf
T3 = refl

-- Test: Merging two more complex trees.
T4 : merge id id add (Node 1 (Node 2 Leaf Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ≡ Node 4 (Node 2 Leaf Leaf) (Node 4 Leaf Leaf)
T4 = refl

-- Test: Merging trees with a different merge function (max).
T5 : merge id id max (Node 5 (Node 3 Leaf Leaf) (Node 7 Leaf Leaf)) (Node 4 (Node 6 Leaf Leaf) (Node 2 Leaf Leaf)) ≡ Node 5 (Node 6 Leaf Leaf) (Node 7 Leaf Leaf)
T5 = refl

-- Test: Merging trees with custom functions for single-tree nodes.
T6 : merge (λ x → x + 1) (λ x → x * 2) add (Node 3 Leaf (Node 2 Leaf Leaf)) (Node 1 (Node 4 Leaf Leaf) Leaf) ≡ Node 4 (Node 8 Leaf Leaf) (Node 3 Leaf Leaf)
T6 = refl

-- Test: Merging trees with different types.
T7 : merge (λ x → if x then 1 else 0) id (λ x y → if x then y + 1 else y) (Node True Leaf Leaf) (Node 5 Leaf Leaf) ≡ Node 6 Leaf Leaf
T7 = refl
