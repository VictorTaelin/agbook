module UG.Shape.pentagon where

open import Base.Float.ALL
open import Base.Float.Type
open import Base.List.Type
open import Base.List.append
open import Base.List.map
open import Base.V2.Type
open import UG.Shape.Type

-- FIXME: correctly define PI
-- FIXME: V2 doesnt exist anymore
pi : Float
pi = 3.14159265359

calculate-vertex : V2 → Float → Float → V2
calculate-vertex (MkV2 cx cy) radius i =
  let angle = (2.0 * pi * i / 5.0) - (pi / 2.0)
  in MkV2 (cx + radius * cos angle) (cy + radius * sin angle)

-- Calculates the vertices of a regular pentagon
calculate-pentagon-vertices : V2 → Float → List V2
calculate-pentagon-vertices center sideLength = do
  let radius = sideLength / (2.0 * sin (pi / 5.0))
  let angles = 0.0 :: 1.0 :: 2.0 :: 3.0 :: 4.0 :: []
  map (calculate-vertex center radius) angles

-- Creates a pentagon Shape centered at the given center with the given side length
pentagon : V2 → Float → Shape
pentagon center sideLength = do
  let vertices = calculate-pentagon-vertices center sideLength
  Polygon vertices
