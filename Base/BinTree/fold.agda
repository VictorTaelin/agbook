module Base.BinTree.fold where

open import Base.BinTree.Type

-- Fold operation for BinTree.
-- - f: Function to apply to each node.
-- - z: Value to use for leaf nodes.
-- - t: The tree to fold over.
-- = The result of folding the tree.
fold : ∀ {A B : Set} -> (A -> B -> B -> B) -> B -> BinTree A -> B
fold f z Leaf                = z
fold f z (Node x left right) = f x (fold f z left) (fold f z right)
