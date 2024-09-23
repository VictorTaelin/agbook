module Base.BitMap.values where

open import Base.List.Type
open import Base.List.append
open import Base.BitMap.Type
open import Base.Maybe.Type

-- Converts a BitMap to a List of the stored values.
-- None values are skipped.
-- - m: The input BitMap.
-- = A list with the values stored in the BitMap.
values : ∀ {A : Set} → BitMap A → List A
values (Node None     lft rgt) = values lft ++ values rgt
values (Node (Some x) lft rgt) = x :: (values lft ++ values rgt)
values Leaf                    = []
