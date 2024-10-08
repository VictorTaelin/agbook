module Base.BinMap.merge where

import Base.BinTree.merge as BinTree
open import Base.BinMap.BinMap
open import Base.Maybe.Maybe

-- Merges two BinMaps, favoring the second BinMap when both have a value.
-- - m1: The 1st BinMap.
-- - m2: The 2nd BinMap.
-- = A new BinMap containing values from both input BinMaps,
--   with values from m2 taking precedence when keys conflict.
merge : ∀ {A : Set} → BinMap A → BinMap A → BinMap A
merge = BinTree.merge (λ x → x) (λ x → x) (λ _ y → y)
