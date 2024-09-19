module Base.Tree.Type where

-- Defines a binary tree datatype.
-- - A: The type of values stored in the tree.
data Tree (A : Set) : Set where
  Node : (val : A) → (lft : Tree A) → (rgt : Tree A) → Tree A
  Leaf : Tree A
