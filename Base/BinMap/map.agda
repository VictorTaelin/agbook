module Base.BinMap.map where

open import Base.BinMap.BinMap
open import Base.Maybe.Maybe
import Base.BinTree.map as BinTree
import Base.Maybe.map as Maybe

-- Applies a function to each value in the BinMap.
-- - f: The function to be applied to each value.
-- - bm: The BinMap to map over.
-- = A new BinMap with the function applied to all values.
map : ∀ {A B : Set} → (A → B) → BinMap A → BinMap B
map f = BinTree.map (Maybe.map f)

