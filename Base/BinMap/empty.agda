module Base.BinMap.empty where

open import Base.BinMap.BinMap
open import Base.BinTree.BinTree

-- Creates an empty BinMap.
-- = An empty BinMap.
empty : ∀ {A : Set} → BinMap A
empty = Leaf

