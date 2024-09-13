module UG.Shape.square where

open import UG.Shape.Type
open import Data.V2.Type
open import Data.List.Type
open import Data.List.append
open import Data.Float.Operations renaming (_f/_ to _/_; _f-_ to _-_)
open import Data.Float.Type

-- Creates a square Shape centered at the given center with the given side length
square : V2 → Float → Shape
square center sideLength = do
  let halfSide = sideLength / 2.0
  let topLeft     = MkV2 (0.0 - halfSide) halfSide
  let topRight    = MkV2 halfSide halfSide
  let bottomRight = MkV2 halfSide (0.0 - halfSide)
  let bottomLeft  = MkV2 (0.0 - halfSide) (0.0 - halfSide)

  Polygon (topLeft :: topRight :: bottomRight :: bottomLeft :: [])




