module Data.AVL.empty where

open import Data.AVL.Type
open import Data.AVL.Balance.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {K V : Set} → AVL K V
empty = Leaf
