module UG.Shape.triangle where

open import Base.List.List
open import Base.List.append
open import Base.V2.V2
open import Base.V2.sub
open import UG.Shape.Shape
open import Base.F64.F64
open import Base.F64.div
open import Base.F64.add

-- Calculates the average of three V2 points.
-- - v1, v2, v3: The three points to average.
-- = The center point (average of the three input points).
center : V2 → V2 → V2 → V2
center (MkV2 x1 y1) (MkV2 x2 y2) (MkV2 x3 y3) =
  MkV2 ((x1 + x2 + x3) / 3.0) ((y1 + y2 + y3) / 3.0)

-- Creates a triangular Shape defined by three vertices.
-- - v1: The first vertex of the triangle (V2).
-- - v2: The second vertex of the triangle (V2).
-- - v3: The third vertex of the triangle (V2).
-- = A Shape representing the triangle with a center and relative vertices.
triangle : V2 → V2 → V2 → Shape
triangle v1 v2 v3 =
  let c = center v1 v2 v3
      rv1 = v1 - c
      rv2 = v2 - c
      rv3 = v3 - c
  in Polygon c (rv1 :: rv2 :: rv3 :: [])

