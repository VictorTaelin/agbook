module Base.AVL.to-list where

open import Base.AVL.Type
open import Base.Pair.Type
open import Base.List.Type
open import Base.List.append

-- Converts an AVL tree to a sorted list.
-- - tree: The AVL tree to convert.
-- = A list containing all elements from the tree in ascending order.
to-list : ∀ {K V : Set} → AVL K V → List (Pair K V)
to-list Leaf = []
to-list (Node value _ left right) =
  to-list left ++ (value :: to-list right)
