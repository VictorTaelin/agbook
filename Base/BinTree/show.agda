module Base.BinTree.show where

import Base.Trait.Show as Show
open import Base.BinTree.BinTree
open import Base.String.String
open import Base.String.append

-- Converts a binary tree to a string representation.
-- 1st: The tree to convert to a string.
-- = A string representation of the tree.
show : ∀ {A : Set} → {{ShowA : Show.Show A}} → BinTree A → String
show Leaf         = "_"
show (Node x l r) = "{" ++ Show.to-string x ++ ", " ++ show l ++ ", " ++ show r ++ "}"
