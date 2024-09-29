module Base.BitMap.values where

open import Base.List.List
open import Base.List.append
open import Base.BitMap.BitMap
open import Base.Maybe.Maybe

-- Converts a BitMap to a List of the stored values.
-- None values are skipped.
-- - m: The input BitMap.
-- = A list with the values stored in the BitMap.
values : ∀ {A : Set} → BitMap A → List A
values (Node None     l r) = values l ++ values r
values (Node (Some v) l r) = v :: (values l ++ values r)
values Leaf                = []
