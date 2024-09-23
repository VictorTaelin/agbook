module Base.Map.merge where

import Base.TreeBin.merge as TreeBin
open import Base.Function.id
open import Base.Map.Type
open import Base.Maybe.Type

-- Merges two Maps, giving priority to values in the second Map when there are conflicts.
-- - m1: The first Map to merge.
-- - m2: The second Map to merge (takes priority on conflicts).
-- = A new Map containing all key-value pairs from both input Maps.
merge : ∀ {A : Set} → Map A → Map A → Map A
merge = TreeBin.merge id id (λ x y → y)
