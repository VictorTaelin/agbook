module Base.AVL.empty where

open import Base.AVL.Type
open import Base.AVL.Balance.Type

-- Creates an empty AVL tree.
-- = An empty AVL tree.
empty : ∀ {K V : Set} → AVL K V
empty = Leaf
