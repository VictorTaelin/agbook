module V2.Main where

open import Float.Main

-- Represents a 2D vector with float coordinates
-- - x: the x-coordinate
-- - y: the y-coordinate
record V2 : Set where
  constructor MkV2
  field
    x : Float
    y : Float
