module Base.BinTree.length where

open import Base.BinTree.BinTree
open import Base.Nat.Nat
open import Base.Nat.add

-- Calculates the number of nodes in a binary tree.
-- - 1st: The binary tree to count.
-- = The total number of nodes in the tree.
length : ∀ {A : Set} → BinTree A → Nat
length Leaf         = Zero
length (Node _ l r) = Succ (add (length l) (length r))
