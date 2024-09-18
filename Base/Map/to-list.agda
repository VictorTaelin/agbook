module Base.Map.to-list where

open import Base.Bits.Type
open import Base.Bits.reverse
open import Base.List.Type
open import Base.List.append
open import Base.Map.Type
open import Base.Maybe.Type
open import Base.Pair.Type

-- Helper function to traverse the Map and accumulate pairs
to-list-helper : ∀ {A : Set} → Map A → Bits → List (Pair Bits A)
to-list-helper (Node None     lft rgt) acc = to-list-helper lft (O acc) ++ to-list-helper rgt (I acc)
to-list-helper (Node (Some x) lft rgt) acc = (reverse acc , x) :: (to-list-helper lft (O acc) ++ to-list-helper rgt (I acc))
to-list-helper Leaf                    _   = []

-- Converts a Map to a List of Bits, A pairs.
-- The Bits represent the path to each element in the Map.
-- None values are skipped.
-- - m: The input Map.
-- = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
to-list : ∀ {A : Set} → Map A → List (Pair Bits A)
to-list m = to-list-helper m E
