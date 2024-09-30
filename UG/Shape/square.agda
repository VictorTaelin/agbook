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
square : V2 → F64 → Shape
square center side-length = 
  let half-side = F64.div side-length 2.0
      top-left     = MkV2 (F64.sub (V2.x center) half-side) (F64.add (V2.y center) half-side)
      top-right    = MkV2 (F64.add (V2.x center) half-side) (F64.add (V2.y center) half-side)
      bottom-right = MkV2 (F64.add (V2.x center) half-side) (F64.sub (V2.y center) half-side)
      bottom-left  = MkV2 (F64.sub (V2.x center) half-side) (F64.sub (V2.y center) half-side)
  in Polygon (top-left :: top-right :: bottom-right :: bottom-left :: [])
