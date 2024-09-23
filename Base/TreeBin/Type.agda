module Base.TreeBin.Type where

-- Defines a binary tree datatype.
-- - A: The type of values stored in the tree.
data TreeBin (A : Set) : Set where
  Node : (val : A) → (lft : TreeBin A) → (rgt : TreeBin A) → TreeBin A
  Leaf : TreeBin A
