module Base.BitMap.empty where

open import Base.BitMap.Type
open import Base.BinTree.Type

-- Creates an empty BitMap.
-- = An empty BitMap.
empty : ∀ {A : Set} -> BitMap A
empty = Leaf
