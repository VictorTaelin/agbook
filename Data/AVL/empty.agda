module Data.AVL.empty where

open import Data.AVL.Type
open import Data.AVL.Balance.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {A : Set} → AVL A
empty = Leaf
