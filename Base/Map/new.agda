module Base.Map.new where

open import Base.Map.Type
open import Base.TreeBin.Type

-- Creates an empty Map.
-- = An empty Map.
new : ∀ {A : Set} → Map A
new = Leaf
