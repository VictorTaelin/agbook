module Data.OrdSet.to-list where

open import Data.OrdSet.Type
open import Data.List.Type
open import Data.Pair.Type
import Data.AVL.keys as AVL

-- Extracts all elements from an OrdSet into a list.
-- - set: The OrdSet to extract elements from.
-- = A list containing all elements from the set.
values : ∀ {V : Set} → OrdSet V → List V
values set = AVL.keys set
