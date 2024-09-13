module UG.Shape.Type where

open import Data.List.Type
open import Data.V2.Type
open import Data.Float.Type

-- Represents a geometric shape
-- - Circle: a circle with a center point and radius
-- - Polygon: a polygon defined by a vector of vertices
data Shape : Set where
  Circle  : V2 → Float → Shape
  Polygon :  List V2 → Shape
