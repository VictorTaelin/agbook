module Base.BinTree.BinTree where

-- Defines a binary tree datatype.
-- - Node: Contains a value and two subtrees.
-- - Leaf: Represents an empty tree.
data BinTree (A : Set) : Set where
  Node : (val : A) -> (lft : BinTree A) -> (rgt : BinTree A) -> BinTree A
  Leaf : BinTree A
