module Tree.Main where

-- Defines a binary tree datatype
-- - A: The type of values stored in the tree
data Tree (A : Set) : Set where
  -- Creates a tree node with a value and left and right subtrees
  node : A → Tree A → Tree A → Tree A
  -- Represents an empty tree or a leaf node
  leaf : Tree A
