module Tree.fold where

open import Tree.Main

-- Fold operation for Tree
-- - f: function to apply to each node
-- - z: value to use for leaf nodes
-- - t: the tree to fold over
-- = the result of folding the tree
fold : ∀ {A B : Set} → (A → B → B → B) → B → Tree A → B
fold f z leaf = z
fold f z (node x left right) = f x (fold f z left) (fold f z right)
