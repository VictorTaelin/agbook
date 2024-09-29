module Base.BitMap.to-list where

open import Base.Bits.Bits
open import Base.Bits.reverse
open import Base.List.List
open import Base.List.append
open import Base.BitMap.BitMap
open import Base.Maybe.Maybe
open import Base.Pair.Pair

-- Helper function to traverse the BitMap and accumulate pairs
to-list-go : ∀ {A : Set} → BitMap A → Bits → List (Pair Bits A)
to-list-go (Node None     l r) acc = to-list-go l (O acc) ++ to-list-go r (I acc)
to-list-go (Node (Some x) l r) acc = (reverse acc , x) :: (to-list-go l (O acc) ++ to-list-go r (I acc))
to-list-go Leaf                _   = []

-- Converts a BitMap to a List of Bits, A pairs.
-- The Bits represent the path to each element in the BitMap.
-- None values are skipped.
-- - m: The input BitMap.
-- = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
to-list : ∀ {A : Set} → BitMap A → List (Pair Bits A)
to-list m = to-list-go m E

