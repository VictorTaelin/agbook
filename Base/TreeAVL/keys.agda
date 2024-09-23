module Base.TreeAVL.keys where

open import Base.List.append
open import Base.List.map
open import Base.List.Type
open import Base.Pair.Type
open import Base.TreeAVL.Type

-- Extracts all keys from an AVL tree.
-- - tree: The AVL tree to extract keys from.
-- = A list containing all keys from the tree.
keys : ∀ {K V : Set} → AVL K V → List K
keys Leaf = []
keys (Node (k , v) _ left right) =
  keys left ++ (k :: keys right)
