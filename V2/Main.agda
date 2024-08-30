module V2.Main where

open import Nat.Main

-- Represents a 2D vector with natural number coordinates
-- - x: the x-coordinate
-- - y: the y-coordinate
record V2 : Set where
  constructor MkV2
  field
    x : Nat
    y : Nat
