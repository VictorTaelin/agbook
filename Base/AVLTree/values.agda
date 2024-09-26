module Base.AVLTree.values where

open import Base.List.append
open import Base.List.map
open import Base.List.List
open import Base.Pair.Pair
open import Base.AVLTree.AVLTree

-- Extracts all values from an AVL tree.
-- - tree: The AVL tree to extract values from.
-- = A list containing all values from the tree.
values : ∀ {K V : Set} -> AVLTree K V -> List V
values Leaf = []
values (Node (k , v) _ left right) =
  values left ++ (v :: values right)
