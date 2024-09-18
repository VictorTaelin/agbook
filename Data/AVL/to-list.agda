module Data.AVL.to-list where

open import Data.AVL.Type
open import Data.List.Type
open import Data.List.append

-- Converts an AVL tree to a sorted list.
-- - tree: The AVL tree to convert.
-- = A list containing all elements from the tree in ascending order.
to-list : ∀ {A : Set} → AVL A → List A
to-list Leaf = []
to-list (Node value _ left right) =
  to-list left ++ (value :: to-list right)
