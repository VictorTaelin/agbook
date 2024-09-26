module UG.Shape.circle where

open import Base.F64.F64
open import Base.V2.V2 
open import UG.Shape.Shape

-- Creates a circular Shape centered at a given point with a specified radius.
-- - center: The center point of the circle (V2).
-- - radius: The radius of the circle (F64).
-- = A Shape representing the circle.
circle : V2 -> F64 -> Shape
circle center radius = Circle center radius
