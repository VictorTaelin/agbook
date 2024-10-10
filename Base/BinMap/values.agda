module Base.BinMap.values where

open import Base.List.List
open import Base.List.append
open import Base.BinMap.BinMap
open import Base.Maybe.Maybe

-- Converts a BinMap to a List of the stored values.
-- None values are skipped.
-- - m: The input BinMap.
-- = A list with the values stored in the BinMap.
values : ∀ {A : Set} → BinMap A → List A
values (Node None     l r) = values l ++ values r
values (Node (Some v) l r) = v :: (values l ++ values r)
values Leaf                = []

