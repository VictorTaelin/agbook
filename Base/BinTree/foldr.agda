module Base.BinTree.foldr where

open import Base.BinTree.BinTree

-- Performs a right-associative fold over a binary tree.
-- - 1st: The folding function.
-- - 2nd: The initial value of the accumulator.
-- - 3rd: The input binary tree.
-- = The result of folding the tree from right to left.
foldr : ∀ {A B : Set} → (A → B → B) → B → BinTree A → B
foldr f z Leaf = z
foldr f z (Node value left right) = f value (foldr f (foldr f z right) left)
