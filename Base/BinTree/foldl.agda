module Base.BinTree.foldl where

open import Base.BinTree.BinTree

-- Performs a left-associative fold over a binary tree.
-- - 1st: The folding function.
-- - 2nd: The initial value of the accumulator.
-- - 3rd: The input binary tree.
-- = The result of folding the tree from left to right.
foldl : ∀ {A B : Set} → (B → A → B) → B → BinTree A → B
foldl f z Leaf = z
foldl f z (Node value left right) = foldl f (f (foldl f z left) value) right
