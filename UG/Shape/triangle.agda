module UG.Shape.triangle where

open import Base.List.Type
open import Base.List.append
open import Base.V2.Type
open import UG.Shape.Type

-- Creates a triangular Shape defined by three vertices.
-- - v1: The first vertex of the triangle (V2).
-- - v2: The second vertex of the triangle (V2).
-- - v3: The third vertex of the triangle (V2).
-- = A Shape representing the triangle.
triangle : V2 -> V2 -> V2 -> Shape
triangle v1 v2 v3 = Polygon (v1 :: v2 :: v3 :: [])
