module UG.Shape.square where

open import Base.F64.F64
open import Base.F64.add
open import Base.F64.sub
open import Base.F64.div
open import Base.List.List
open import Base.V2.V2
open import UG.Shape.Shape

-- Creates a square Shape centered at a given point with a specified side length.
-- - center: The center point of the square (V2).
-- - side-length: The length of each side of the square (F64).
-- = A Shape representing the square.
square : V2 → F64 → Shape
square center side-length = 
  let half-side = side-length / 2.0
      top-left     = MkV2 (0.0 - half-side) half-side
      top-right    = MkV2 half-side half-side
      bottom-right = MkV2 half-side (0.0 - half-side)
      bottom-left  = MkV2 (0.0 - half-side) (0.0 - half-side)
  in Polygon center (top-left :: top-right :: bottom-right :: bottom-left :: [])

