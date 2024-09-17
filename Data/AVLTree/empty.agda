module Data.AVLTree.empty where

open import Data.AVLTree.Type
open import Data.AVLTree.Balance.Type

empty : ∀ {A : Set} → AVLTree A
empty = Leaf
