module Data.AVL.values where

open import Data.AVL.Type
open import Data.List.Type
open import Data.List.map
open import Data.List.append
open import Data.Pair.Type
open import Data.Pair.snd

-- Extracts all values from an AVL tree.
-- - tree: The AVL tree to extract values from.
-- = A list containing all values from the tree.
values : ∀ {K V : Set} → AVL K V → List V
values Leaf = []
values (Node kv _ left right) =
  values left ++ (Pair.snd kv :: values right)
