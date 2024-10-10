module Base.BinTree.leaf where

open import Base.BinTree.BinTree

-- Creates a leaf node (empty tree).
-- = An empty tree (leaf node).
leaf : ∀ {A : Set} → BinTree A
leaf = Leaf
