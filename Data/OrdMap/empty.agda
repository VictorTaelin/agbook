module Data.OrdMap.empty where

open import Data.OrdMap.Type
import Data.AVL.empty as AVL

-- Creates an empty OrdMap.
-- = An empty OrdMap.
empty : ∀ {K V : Set} → OrdMap K V
empty = AVL.empty
