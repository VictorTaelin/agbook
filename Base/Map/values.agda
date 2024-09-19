module Base.Map.values where

open import Base.List.Type
open import Base.List.append
open import Base.Map.Type
open import Base.Maybe.Type

-- Converts a Map to a List of the stored values.
-- None values are skipped.
-- - m: The input Map.
-- = A list with the values stored in the Map.
values : ∀ {A : Set} → Map A → List A
values (Node None     lft rgt) = values lft ++ values rgt
values (Node (Some x) lft rgt) = x :: (values lft ++ values rgt)
values Leaf                    = []
