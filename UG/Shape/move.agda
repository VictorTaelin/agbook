module UG.Shape.move where

open import UG.Shape.Shape 
open import Base.V2.V2
open import Base.V2.add

-- Moves a Shape by a given vector.
-- - shape: The Shape to be moved.
-- - v: The vector to move the Shape by.
-- = A new Shape moved by the given vector.
move : Shape → V2 → Shape
move (Circle center radius) v = Circle (center + v) radius
move (Polygon center vertices) v = Polygon (center + v) vertices

