module Base.BitMap.to-list where

open import Base.Bits.Type
open import Base.Bits.reverse
open import Base.List.Type
open import Base.List.append
open import Base.BitMap.Type
open import Base.Maybe.Type
open import Base.Pair.Type

-- Helper function to traverse the BitMap and accumulate pairs
to-list-helper : ∀ {A : Set} → BitMap A → Bits → List (Pair Bits A)
to-list-helper (Node None     lft rgt) acc = to-list-helper lft (O acc) ++ to-list-helper rgt (I acc)
to-list-helper (Node (Some x) lft rgt) acc = (reverse acc , x) :: (to-list-helper lft (O acc) ++ to-list-helper rgt (I acc))
to-list-helper Leaf                    _   = []

-- Converts a BitMap to a List of Bits, A pairs.
-- The Bits represent the path to each element in the BitMap.
-- None values are skipped.
-- - m: The input BitMap.
-- = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
to-list : ∀ {A : Set} → BitMap A → List (Pair Bits A)
to-list m = to-list-helper m E
