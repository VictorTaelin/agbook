module Base.OrdMap.to-list where

import Base.TreeAVL.to-list as AVL
open import Base.List.Type
open import Base.OrdMap.Type
open import Base.Pair.Type
open import Base.TreeAVL.Type

-- Converts an OrdMap to a sorted list of key-value pairs.
-- - map: The OrdMap to convert.
-- = A list containing all key-value pairs from the map in ascending order of keys.
to-list : ∀ {K V : Set} -> OrdMap K V -> List (Pair K V)
to-list = AVL.to-list
