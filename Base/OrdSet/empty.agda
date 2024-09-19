module Base.OrdSet.empty where

open import Base.OrdSet.Type
import Base.AVL.empty as AVL

-- Creates an empty OrdSet.
-- = An empty OrdSet.
empty : ∀ {V : Set} → OrdSet V
empty = AVL.empty
