module Data.AVLTree.from-list where

open import Data.AVLTree.Type
open import Data.AVLTree.insert
open import Data.AVLTree.empty
open import Data.List.Type
open import Data.List.foldr
open import Data.Trait.Ord

-- Constructs an AVL tree from a list of elements.
-- - xs: The input list of elements.
-- = An AVL tree containing all elements from the input list.
from-list : ∀ {A : Set} → {{OrdA : Ord A}} → List A → AVLTree A
from-list = foldr insert empty
