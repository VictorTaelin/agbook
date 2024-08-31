module Data.Map.new where

open import Data.Map.Main
open import Data.Tree.Main

-- Creates an empty Map.
-- = An empty Map.
new : ∀ {A : Set} → Map A
new = leaf
