module Base.BitMap.empty where

open import Base.BitMap.Type
open import Base.TreeBin.Type

-- Creates an empty BitMap.
-- = An empty BitMap.
empty : ∀ {A : Set} -> BitMap A
empty = Leaf
