module Base.BinTree.node where

open import Base.BinTree.BinTree

-- Creates a binary tree node with a value and left and right subtrees.
-- - 1st: The value stored in this node.
-- - 2nd: The left subtree.
-- - 3rd: The right subtree.
-- = A new binary tree node.
node : ∀ {A : Set} → A → BinTree A → BinTree A → BinTree A
node value left right = Node value left right
