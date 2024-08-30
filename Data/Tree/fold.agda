module Data.Tree.fold where

open import Data.Tree.Main

-- Fold operation for Tree.
-- - f: Function to apply to each node.
-- - z: Value to use for leaf nodes.
-- - t: The tree to fold over.
-- = The result of folding the tree.
fold : ∀ {A B : Set} → (A → B → B → B) → B → Tree A → B
fold f z leaf                = z
fold f z (node x left right) = f x (fold f z left) (fold f z right)
