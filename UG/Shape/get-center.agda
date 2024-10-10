module UG.Shape.get-center where

open import Base.V2.V2
open import UG.Shape.Shape

-- Returns the center point of a given Shape.
-- - shape: The Shape to get the center from.
-- = The center point of the Shape as a V2.
get-center : Shape → V2
get-center (Circle center _) = center
get-center (Polygon center _) = center

