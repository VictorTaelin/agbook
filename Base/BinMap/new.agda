module Base.BinMap.new where

open import Base.BinMap.BinMap
open import Base.BinTree.BinTree

-- Creates an empty BinMap.
-- = An empty BinMap.
new : ∀ {A : Set} → BinMap A
new = Leaf

