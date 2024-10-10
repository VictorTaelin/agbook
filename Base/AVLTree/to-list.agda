module Base.AVLTree.to-list where

open import Base.List.append
open import Base.List.List
open import Base.Pair.Pair
open import Base.AVLTree.AVLTree

-- Converts an AVL tree to a sorted list.
-- - tree: The AVL tree to convert.
-- = A list containing all elements from the tree in ascending order.
to-list : ∀ {K V : Set} → AVLTree K V → List (Pair K V)
to-list Leaf = []
to-list (Node value _ left right) =
  to-list left ++ (value :: to-list right)

