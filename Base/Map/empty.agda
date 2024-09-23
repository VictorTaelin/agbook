module Base.Map.empty where

open import Base.Map.Type
open import Base.TreeBin.Type

-- Creates an empty Map.
-- = An empty Map.
empty : ∀ {A : Set} → Map A
empty = Leaf
