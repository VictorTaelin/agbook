module Base.TreeAVL.from-list where

open import Base.List.foldr
open import Base.List.Type
open import Base.Pair.Type
open import Base.Trait.Ord
open import Base.TreeAVL.empty
open import Base.TreeAVL.insert
open import Base.TreeAVL.Type

-- Constructs an AVL tree from a list of elements.
-- - xs: The input list of elements.
-- = An AVL tree containing all elements from the input list.
from-list : ∀ {K V : Set} -> {{_ : Ord K}} -> List (Pair K V) -> AVL K V
from-list = foldr insert empty
