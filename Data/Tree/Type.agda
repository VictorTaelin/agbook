module Data.Tree.Type where

-- Defines a binary tree datatype.
-- - A: The type of values stored in the tree.
data Tree (A : Set) : Set where
  node : (val : A) → (lft : Tree A) → (rgt : Tree A) → Tree A
  leaf : Tree A
