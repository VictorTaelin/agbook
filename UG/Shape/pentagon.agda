module UG.Shape.pentagon where

open import UG.Shape.Type
open import Data.V2.Type
open import Data.List.Type
open import Data.List.append
open import Data.List.map
open import Data.Float.Operations renaming (_f/_ to _/_; _f-_ to _-_; _f*_ to _*_; fsin to sin; fcos to cos; _f+_ to _+_)
open import Data.Float.Type

-- FIXME: correctly define PI
pi : Float
pi = 3.14159265359

private
  calculateVertex : V2 → Float → Float → V2
  calculateVertex (MkV2 cx cy) radius i =
    let angle = (2.0 * pi * i / 5.0) - (pi / 2.0)
    in MkV2 (cx + radius * cos angle) (cy + radius * sin angle)

  -- Calculates the vertices of a regular pentagon
  calculatePentagonVertices : V2 → Float → List V2
  calculatePentagonVertices center sideLength = do
    let radius = sideLength / (2.0 * sin (pi / 5.0))
    let angles = 0.0 :: 1.0 :: 2.0 :: 3.0 :: 4.0 :: []
    map (calculateVertex center radius) angles

-- Creates a pentagon Shape centered at the given center with the given side length
pentagon : V2 → Float → Shape
pentagon center sideLength = do
  let vertices = calculatePentagonVertices center sideLength
  Polygon vertices
