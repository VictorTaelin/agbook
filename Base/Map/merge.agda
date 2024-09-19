module Base.Map.merge where

open import Base.Map.Type
open import Base.Map.get
open import Base.Map.set
open import Base.Map.to-list
open import Base.Maybe.Type
open import Base.Maybe.Monad.bind
open import Base.Bits.Type
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type

-- merge entry helper
merge-entry : ∀ {A : Set} → Pair Bits A → Map A → Map A
merge-entry (k , v) m = set m k v

-- Merges two Maps, giving priority to values in the second Map when there are conflicts.
-- - m1: The first Map to merge.
-- - m2: The second Map to merge (takes priority on conflicts).
-- = A new Map containing all key-value pairs from both input Maps.
merge : ∀ {A : Set} → Map A → Map A → Map A
merge m1 m2 = foldr merge-entry m1 (to-list m2)
