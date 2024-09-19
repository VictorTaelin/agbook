module Base.AVL.values where

open import Base.AVL.Type
open import Base.List.Type
open import Base.List.map
open import Base.List.append
open import Base.Pair.Type

-- Extracts all values from an AVL tree.
-- - tree: The AVL tree to extract values from.
-- = A list containing all values from the tree.
values : ∀ {K V : Set} → AVL K V → List V
values Leaf = []
values (Node (k , v) _ left right) =
  values left ++ (v :: values right)
