module Base.BinTree.right where

open import Base.BinTree.BinTree
open import Base.Maybe.Maybe

-- Gets the right subtree of a binary tree node.
-- - 1st: The 1st argument, representing the input tree.
-- = The right subtree, or None if the tree is a leaf.
right : ∀ {A : Set} → BinTree A → Maybe (BinTree A)
right Leaf         = None
right (Node x l r) = Some r
