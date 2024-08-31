module Data.Map.new where

open import Data.Map.Type
open import Data.Tree.Type

-- Creates an empty Map.
-- = An empty Map.
new : ∀ {A : Set} → Map A
new = leaf
