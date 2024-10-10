module Base.BinTree.is-leaf where

open import Base.BinTree.BinTree
open import Base.Bool.Bool

-- Checks if a binary tree is a leaf (empty).
-- - 1st: The input binary tree.
-- = True if the tree is a leaf, False otherwise.
is-leaf : ∀ {A : Set} → BinTree A → Bool
is-leaf Leaf         = True
is-leaf (Node _ _ _) = False
