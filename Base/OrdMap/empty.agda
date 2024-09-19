module Base.OrdMap.empty where

open import Base.OrdMap.Type
import Base.AVL.empty as AVL

-- Creates an empty OrdMap.
-- = An empty OrdMap.
empty : ∀ {K V : Set} → OrdMap K V
empty = AVL.empty
