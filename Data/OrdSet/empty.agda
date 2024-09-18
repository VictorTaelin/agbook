module Data.OrdSet.empty where

open import Data.OrdSet.Type
import Data.AVL.empty as AVL

-- Creates an empty OrdSet.
-- = An empty OrdSet.
empty : ∀ {V : Set} → OrdSet V
empty = AVL.empty
