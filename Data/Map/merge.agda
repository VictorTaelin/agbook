module Data.Map.merge where

open import Data.Map.Type
open import Data.Map.get
open import Data.Map.set
open import Data.Map.to-list
open import Data.Maybe.Type
open import Data.Maybe.bind
open import Data.Bits.Type
open import Data.List.Type
open import Data.List.foldr
open import Data.Pair.Type

-- Merges two Maps, giving priority to values in the second Map when there are conflicts.
-- - m1: The first Map to merge.
-- - m2: The second Map to merge (takes priority on conflicts).
-- = A new Map containing all key-value pairs from both input Maps.
merge : ∀ {A : Set} → Map A → Map A → Map A
merge m1 m2 = foldr merge-entry m1 (to-list m2)
  where
    merge-entry : ∀ {A : Set} → Pair Bits A → Map A → Map A
    merge-entry (k , v) m = set m k v
