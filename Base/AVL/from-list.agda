module Base.AVL.from-list where

open import Base.AVL.Type
open import Base.AVL.insert
open import Base.AVL.empty
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type
open import Base.Ord.Trait

-- Constructs an AVL tree from a list of elements.
-- - xs: The input list of elements.
-- = An AVL tree containing all elements from the input list.
from-list : ∀ {K V : Set} → {{_ : Ord K}} → List (Pair K V) → AVL K V
from-list = foldr insert empty
