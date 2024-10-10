module Base.BinTree.match where

open import Base.BinTree.BinTree

-- Dependent eliminator for binary trees.
-- - 1st: The motive (type family) for the elimination.
-- - 2nd: The result for the leaf case.
-- - 3rd: The function to apply for the node case.
-- - 4th: The tree to eliminate (scrutinee).
-- = The result of the elimination, whose type depends on the input tree.
match : ∀ {p} {A : Set}
      → (P : BinTree A → Set p)
      → P Leaf
      → ((val : A) → (lft : BinTree A) → (rgt : BinTree A) → P lft → P rgt → P (Node val lft rgt))
      → (tree : BinTree A)
      → P tree
match P leaf node Leaf         = leaf
match P leaf node (Node x l r) = node x l r (match P leaf node l) (match P leaf node r)
