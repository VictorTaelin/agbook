module Base.BinMap.union where

open import Base.BinMap.BinMap
open import Base.BinMap.set
open import Base.BinMap.to-list
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair

-- Performs a left-biased union of two Maps.
-- Values from the first BinMap take precedence over values from the second BinMap.
-- - m1: The 1st BinMap (takes priority on conflicts).
-- - m2: The 2nd BinMap.
-- = A new BinMap containing all key-value pairs from both input Maps,
--   with values from m1 taking precedence when keys conflict.
union : ∀ {A : Set} → BinMap A → BinMap A → BinMap A
union m1 m2 = foldr (λ (k , v) acc → set acc k v) m2 (to-list m1)
