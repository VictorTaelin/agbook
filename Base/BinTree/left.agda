module Base.BinTree.left where

open import Base.BinTree.BinTree
open import Base.Maybe.Maybe

-- Gets the left subtree of a binary tree node.
-- 1st: The input tree.
-- = The left subtree, or None if the tree is a leaf.
left : ∀ {A : Set} → BinTree A → Maybe (BinTree A)
left Leaf         = None
left (Node _ l _) = Some l
