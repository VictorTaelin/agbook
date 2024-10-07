module Base.BinTree.map where

open import Base.BinTree.BinTree

-- Applies a function to each element of a binary tree.
-- 1st: The function to be applied to each element.
-- 2nd: The binary tree to map over.
-- = A new binary tree with the function applied to all elements.
map : ∀ {A B : Set} → (A → B) → BinTree A → BinTree B
map f Leaf         = Leaf
map f (Node x l r) = Node (f x) (map f l) (map f r)
