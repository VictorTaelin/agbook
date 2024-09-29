module Base.AVLTree.keys where

open import Base.List.append
open import Base.List.map
open import Base.List.List
open import Base.Pair.Pair
open import Base.AVLTree.AVLTree

-- Extracts all keys from an AVL tree.
-- - tree: The AVL tree to extract keys from.
-- = A list containing all keys from the tree.
keys : ∀ {K V : Set} → AVLTree K V → List K
keys Leaf = []
keys (Node (k , v) _ left right) =
  keys left ++ (k :: keys right)
