module Base.AVL.singleton where

open import Base.AVL.Type
open import Base.AVL.Balance.Type
open import Base.Pair.Type

-- Creates a singleton AVL tree with one element.
-- - x: The value to be stored in the tree.
-- = An AVL tree containing only the given value.
singleton : ∀ {K V : Set} → Pair K V → AVL K V
singleton p = Node p zero Leaf Leaf
