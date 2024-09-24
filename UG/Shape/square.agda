module UG.Shape.square where

open import Data.F64.ALL
open import Data.F64.Type
open import Data.List.Type
open import Data.List.append
open import Data.V2.Type
open import UG.Shape.Type

-- Creates a square Shape centered at a given point with a specified side length.
-- - center: The center point of the square (V2).
-- - side-length: The length of each side of the square (F64).
-- = A Shape representing the square.
square : V2 -> F64 -> Shape
square center side-length = do
  let half-side = side-length / 2.0
  let top-left     = MkV2 (0.0 - half-side) half-side
  let top-right    = MkV2 half-side half-side
  let bottom-right = MkV2 halfSide (0.0 - half-side)
  let bottom-left  = MkV2 (0.0 - half-side) (0.0 - half-side)

  Polygon (top-left :: top-right :: bottom-right :: bottom-left :: [])
