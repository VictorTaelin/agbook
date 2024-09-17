module Data.Map.values where

open import Data.List.Type
open import Data.List.append
open import Data.Map.Type
open import Data.Maybe.Type

-- Converts a Map to a List of the stored values.
-- None values are skipped.
-- - m: The input Map.
-- = A list with the values stored in the Map.
values : ∀ {A : Set} → Map A → List A
values (Node None     lft rgt) = values lft ++ values rgt
values (Node (Some x) lft rgt) = x :: (values lft ++ values rgt)
values Leaf                    = []
