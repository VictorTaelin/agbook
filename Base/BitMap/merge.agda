module Base.BitMap.merge where

import Base.TreeBin.merge as TreeBin
open import Base.Function.id
open import Base.BitMap.Type
open import Base.Maybe.Type

-- Merges two Maps, giving priority to values in the second BitMap when there are conflicts.
-- - m1: The first BitMap to merge.
-- - m2: The second BitMap to merge (takes priority on conflicts).
-- = A new BitMap containing all key-value pairs from both input Maps.
merge : ∀ {A : Set} → BitMap A → BitMap A → BitMap A
merge = TreeBin.merge id id (λ x y → y)
