module Base.BinTree.merge where

open import Base.String.Type
open import Base.BinTree.Type

-- Merges two trees using combining functions.
-- - a: Function to handle cases where only the first tree has a value.
-- - b: Function to handle cases where only the second tree has a value.
-- - ab: Function to combine values when both trees have a value.
-- - t1: The first input tree.
-- - t2: The second input tree.
-- = A new tree where each node is the result of applying the appropriate
--   function based on the presence of values in t1 and t2.
merge : ∀ {A B C : Set} -> (a : A -> C) -> (b : B -> C) -> (ab : A -> B -> C) -> BinTree A -> BinTree B -> BinTree C
merge a b ab Leaf            Leaf            = Leaf
merge a b ab Leaf            (Node x2 l2 r2) = Node (b x2) (merge a b ab Leaf l2) (merge a b ab Leaf r2)
merge a b ab (Node x1 l1 r1) Leaf            = Node (a x1) (merge a b ab l1 Leaf) (merge a b ab r1 Leaf)
merge a b ab (Node x1 l1 r1) (Node x2 l2 r2) = Node (ab x1 x2) (merge a b ab l1 l2) (merge a b ab r1 r2)
