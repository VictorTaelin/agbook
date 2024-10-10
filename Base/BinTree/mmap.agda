module Base.BinTree.mmap where

open import Base.BinTree.BinTree
open import Base.BinTree.fold
open import Base.Trait.Monad

-- Applies a monadic action to each element of a binary tree.
-- 1st: The monadic function to be applied to each element.
-- 2nd: The binary tree to map over.
-- = A monadic value containing the result of applying the function
--   to each element, maintaining the tree structure.
mmap : ∀ {M : Set → Set} {{monadM : Monad M}} {A B : Set}
       → (A → M B) → BinTree A → M (BinTree B)
mmap f Leaf = do
  pure Leaf
mmap f (Node x l r) = do
  x ← f x
  l ← mmap f l
  r ← mmap f r
  pure (Node x l r)
