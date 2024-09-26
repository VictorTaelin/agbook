module Base.BitMap.merge where

import Base.BinTree.merge as BinTree
open import Base.BitMap.BitMap
open import Base.Maybe.Maybe

-- Merges two BitMaps, favoring the second BitMap when both have a value.
-- - m1: The 1st BitMap.
-- - m2: The 2nd BitMap.
-- = A new BitMap containing values from both input BitMaps,
--   with values from m2 taking precedence when keys conflict.
merge : ∀ {A : Set} -> BitMap A -> BitMap A -> BitMap A
merge = BinTree.merge (λ x -> x) (λ x -> x) (λ _ y -> y)
