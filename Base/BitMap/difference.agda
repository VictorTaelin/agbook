module Base.BitMap.difference where

open import Base.BitMap.BitMap
open import Base.BitMap.del
open import Base.BitMap.to-list
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair
open import Base.Pair.get-fst

-- Computes the difference between two BitMaps.
-- Removes all key-value pairs from the first BitMap that have keys present in the second BitMap.
-- - m1: The BitMap to remove keys from.
-- - m2: The BitMap containing keys to be removed.
-- = A new BitMap containing key-value pairs from m1 whose keys are not present in m2.
difference : ∀ {A : Set} -> BitMap A -> BitMap A -> BitMap A
difference m1 m2 = foldr (λ pair acc -> del acc (fst pair)) m1 (to-list m2)