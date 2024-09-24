module Base.BinTree.Type where

-- Defines a binary tree datatype.
-- - A: The type of values stored in the tree.
data BinTree (A : Set) : Set where
  Node : (val : A) -> (lft : BinTree A) -> (rgt : BinTree A) -> BinTree A
  Leaf : BinTree A
