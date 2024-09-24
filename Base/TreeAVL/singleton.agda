module Base.TreeAVL.singleton where

open import Base.Pair.Type
open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.Type

-- Creates a singleton AVL tree with one element.
-- - x: The value to be stored in the tree.
-- = An AVL tree containing only the given value.
singleton : ∀ {K V : Set} -> Pair K V -> AVL K V
singleton p = Node p zero Leaf Leaf
