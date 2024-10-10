module Base.BinTree.fold where

open import Base.BinTree.BinTree

-- Performs a fold operation on a binary tree.
-- 1st: Function to apply to each node.
-- 2nd: Value to use for leaf nodes.
-- 3rd: The tree to fold over.
-- = The result of folding the tree.
fold : ∀ {A B : Set} → (A → B → B → B) → B → BinTree A → B
fold f z Leaf                = z
fold f z (Node x left right) = f x (fold f z left) (fold f z right)
