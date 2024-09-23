module Base.BitMap.new where

open import Base.BitMap.Type
open import Base.TreeBin.Type

-- Creates an empty BitMap.
-- = An empty BitMap.
new : ∀ {A : Set} -> BitMap A
new = Leaf
