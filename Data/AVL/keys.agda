module Data.AVL.keys where

open import Data.AVL.Type
open import Data.List.Type
open import Data.List.map
open import Data.List.append
open import Data.Pair.Type
open import Data.Pair.fst

-- Extracts all keys from an AVL tree.
-- - tree: The AVL tree to extract keys from.
-- = A list containing all keys from the tree.
keys : ∀ {K V : Set} → AVL K V → List K
keys Leaf = []
keys (Node kv _ left right) =
  keys left ++ (Pair.fst kv :: keys right)
