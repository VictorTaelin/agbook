module Data.Map.to-list where

open import Data.Bits.Type
open import Data.Bits.reverse
open import Data.List.Type
open import Data.List.append
open import Data.Map.Type
open import Data.Maybe.Type
open import Data.Pair.Type

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
