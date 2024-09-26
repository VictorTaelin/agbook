module UG.Shape.square where

import Base.F64.ALL as F64
open import Base.F64.F64
open import Base.List.List
open import Base.List.append
open import Base.V2.V2
open import UG.Shape.Shape

-- Creates a square Shape centered at a given point with a specified side length.
-- - center: The center point of the square (V2).
-- - side-length: The length of each side of the square (F64).
-- = A Shape representing the square.
square : V2 -> F64 -> Shape
square center side-length = do
  let half-side = side-length F64./ 2.0
  let top-left     = MkV2 (0.0 F64.- half-side) half-side
  let top-right    = MkV2 half-side half-side
  let bottom-right = MkV2 half-side (0.0 F64.- half-side)
  let bottom-left  = MkV2 (0.0 F64.- half-side) (0.0 F64.- half-side)

  Polygon (top-left :: top-right :: bottom-right :: bottom-left :: [])
