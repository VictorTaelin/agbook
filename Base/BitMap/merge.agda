module Base.BitMap.merge where

import Base.TreeBin.merge as TreeBin
open import Base.BitMap.Type
open import Base.Maybe.Type

-- Merges two BitMaps, favoring the second BitMap when both have a value.
-- - m1: The 1st BitMap.
-- - m2: The 2nd BitMap.
-- = A new BitMap containing values from both input BitMaps,
--   with values from m2 taking precedence when keys conflict.
merge : ∀ {A : Set} → BitMap A → BitMap A → BitMap A
merge = TreeBin.merge (λ x → x) (λ x → x) (λ _ y → y)