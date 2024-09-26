module Base.BitMap.empty where

open import Base.BitMap.BitMap
open import Base.BinTree.BinTree

-- Creates an empty BitMap.
-- = An empty BitMap.
empty : ∀ {A : Set} -> BitMap A
empty = Leaf
