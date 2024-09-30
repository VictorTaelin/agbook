module Base.BitMap.new where

open import Base.BitMap.BitMap
open import Base.BinTree.BinTree

-- Creates an empty BitMap.
-- = An empty BitMap.
new : ∀ {A : Set} → BitMap A
new = Leaf
