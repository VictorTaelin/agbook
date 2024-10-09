module Base.BinMap.difference where

open import Base.BinMap.BinMap
open import Base.BinMap.del
open import Base.BinMap.to-list
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair
open import Base.Pair.get-fst

-- Computes the difference between two BinMaps.
-- Removes all key-value pairs from the first BinMap that have keys present in the second BinMap.
-- - m1: The BinMap to remove keys from.
-- - m2: The BinMap containing keys to be removed.
-- = A new BinMap containing key-value pairs from m1 whose keys are not present in m2.
difference : ∀ {A : Set} -> BinMap A -> BinMap A -> BinMap A
difference m1 m2 = foldr (λ pair acc -> del acc (fst pair)) m1 (to-list m2)

