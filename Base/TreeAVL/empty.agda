module Base.TreeAVL.empty where

open import Base.TreeAVL.Balance.Type
open import Base.TreeAVL.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {K V : Set} → AVL K V
empty = Leaf
