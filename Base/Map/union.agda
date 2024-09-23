module Base.Map.union where

open import Base.Map.Type
open import Base.Map.set
open import Base.Map.to-list
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type

-- Performs a left-biased union of two Maps.
-- Values from the first Map take precedence over values from the second Map.
-- - m1: The first Map (takes priority on conflicts).
-- - m2: The second Map.
-- = A new Map containing all key-value pairs from both input Maps,
--   with values from m1 taking precedence when keys conflict.
union : ∀ {A : Set} → Map A → Map A → Map A
union m1 m2 = foldr (λ (k , v) acc → set acc k v) m2 (to-list m1)
