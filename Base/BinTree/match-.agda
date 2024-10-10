module Base.BinTree.match- where

open import Base.BinTree.BinTree
open import Base.BinTree.match
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.max

-- Test cases for BinTree match function

count-nodes : ∀ {A : Set} → BinTree A → Nat
count-nodes = match (λ _ → Nat) 0 (λ _ _ _ l r → Succ (add l r))

-- Test: Counting nodes
T0 : count-nodes (Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf (Node 0 Leaf Leaf))) ≡ 4
T0 = refl

tree-depth : ∀ {A : Set} → BinTree A → Nat
tree-depth = match (λ _ → Nat) 0 (λ _ _ _ l r → Succ (max l r))

-- Test: Tree depth
T1 : tree-depth (Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf (Node 0 Leaf Leaf))) ≡ 3
T1 = refl

leaf-count : ∀ {A : Set} → BinTree A → Nat
leaf-count = match (λ _ → Nat) 1 (λ _ _ _ l r → add l r)

-- Test: Leaf count
T2 : leaf-count (Node 0 (Node 0 Leaf Leaf) (Node 0 Leaf (Node 0 Leaf Leaf))) ≡ 5
T2 = refl

sum-tree : BinTree Nat → Nat
sum-tree = match (λ _ → Nat) 0 (λ val _ _ l r → add val (add l r))

-- Test: Sum of values (for Nat trees)
T3 : sum-tree (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) ≡ 6
T3 = refl
