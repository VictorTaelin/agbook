module Data.AVL.from-list where

open import Data.AVL.Type
open import Data.AVL.insert
open import Data.AVL.empty
open import Data.List.Type
open import Data.List.foldr
open import Data.Pair.Type
open import Data.Trait.Ord

-- Constructs an AVL tree from a list of elements.
-- - xs: The input list of elements.
-- = An AVL tree containing all elements from the input list.
from-list : ∀ {K V : Set} → {{_ : Ord K}} → List (Pair K V) → AVL K V
from-list = foldr insert empty
