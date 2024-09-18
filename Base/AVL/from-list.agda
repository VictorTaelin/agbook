module Base.AVL.from-list where

open import Base.AVL.Type
open import Base.AVL.insert
open import Base.AVL.empty
open import Base.List.Type
open import Base.List.foldr
open import Base.Trait.Ord

-- Constructs an AVL tree from a list of elements.
-- - xs: The input list of elements.
-- = An AVL tree containing all elements from the input list.
from-list : ∀ {A : Set} → {{OrdA : Ord A}} → List A → AVL A
from-list = foldr insert empty
