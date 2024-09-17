module Data.AVLTree.singleton where

open import Data.AVLTree.Type
open import Data.AVLTree.Balance.Type

singleton : ∀ {A : Set} → A → AVLTree A
singleton x = Node x zero Leaf Leaf
