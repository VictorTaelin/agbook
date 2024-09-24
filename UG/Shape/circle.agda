module UG.Shape.circle where

open import Base.Float.Type
open import Base.V2.Type 
open import UG.Shape.Type

-- Creates a circular Shape centered at a given point with a specified radius.
-- - center: The center point of the circle (V2).
-- - radius: The radius of the circle (Float).
-- = A Shape representing the circle.
circle : V2 -> Float -> Shape
circle center radius = Circle center radius
