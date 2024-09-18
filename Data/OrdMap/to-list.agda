module Data.OrdMap.to-list where

open import Data.OrdMap.Type
open import Data.List.Type
open import Data.Pair.Type
open import Data.AVL.Type
import Data.AVL.to-list as AVL

-- Converts an OrdMap to a sorted list of key-value pairs.
-- - map: The OrdMap to convert.
-- = A list containing all key-value pairs from the map in ascending order of keys.
to-list : ∀ {K V : Set} → OrdMap K V → List (Pair K V)
to-list = AVL.to-list
