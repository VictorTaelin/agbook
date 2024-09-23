module UG.Shape.square where

open import Data.Float.ALL
open import Data.Float.Type
open import Data.List.Type
open import Data.List.append
open import Data.V2.Type
open import UG.Shape.Type

-- Creates a square Shape centered at the given center with the given side length
square : V2 → Float → Shape
square center side-length = do
  let half-side = side-length / 2.0
  let top-left     = MkV2 (0.0 - half-side) half-side
  let top-right    = MkV2 half-side half-side
  let bottom-right = MkV2 halfSide (0.0 - half-side)
  let bottom-left  = MkV2 (0.0 - half-side) (0.0 - half-side)

  Polygon (top-left :: top-right :: bottom-right :: bottom-left :: [])

