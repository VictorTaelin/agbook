module Base.BinTree.value where

open import Base.BinTree.BinTree
open import Base.Maybe.Maybe

-- Gets the value of a binary tree node.
-- - 1st: The 1st argument, representing the input tree.
-- = The value of the node, or None if the tree is a leaf.
value : ∀ {A : Set} → BinTree A → Maybe A
value Leaf         = None
value (Node v _ _) = Some v
