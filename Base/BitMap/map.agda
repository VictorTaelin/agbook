module Base.BitMap.map where

open import Base.BitMap.BitMap
open import Base.Maybe.Maybe
import Base.BinTree.map as BinTree
import Base.Maybe.map as Maybe

-- Applies a function to each value in the BitMap.
-- - f: The function to be applied to each value.
-- - bm: The BitMap to map over.
-- = A new BitMap with the function applied to all values.
map : ∀ {A B : Set} → (A → B) → BitMap A → BitMap B
map f = BinTree.map (Maybe.map f)
