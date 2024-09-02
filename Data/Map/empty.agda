module Data.Map.empty where

open import Data.Map.Type
open import Data.Tree.Type

-- Creates an empty Map.
-- = An empty Map.
empty : ∀ {A : Set} → Map A
empty = Leaf
