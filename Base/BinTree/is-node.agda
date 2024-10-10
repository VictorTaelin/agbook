module Base.BinTree.is-node where

open import Base.BinTree.BinTree
open import Base.Bool.Bool

-- Checks if a binary tree is a node (non-empty).
-- - 1st: The input binary tree.
-- = True if the tree is a node, False otherwise.
is-node : ∀ {A : Set} → BinTree A → Bool
is-node Leaf         = False
is-node (Node _ _ _) = True
