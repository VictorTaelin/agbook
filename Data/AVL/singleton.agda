module Data.AVL.singleton where

open import Data.AVL.Type
open import Data.AVL.Balance.Type

-- Creates a singleton AVL tree with one element.
-- - x: The value to be stored in the tree.
-- = An AVL tree containing only the given value.
singleton : ∀ {A : Set} → A → AVL A
singleton x = Node x zero Leaf Leaf
