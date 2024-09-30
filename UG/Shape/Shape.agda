module UG.Shape.Shape where

open import Base.F64.F64
open import Base.List.List
open import Base.V2.V2

-- Represents a geometric shape.
-- - Circle: a circle with a center point and radius.
-- - Polygon: a polygon defined by a vector of vertices.
data Shape : Set where
  Circle  : V2 → F64 → Shape
  Polygon : List V2 → Shape

{-# FOREIGN GHC
import qualified Data.Vector as V
import MAlonzo.Code.Base.V2.V2 (V2(..))

data Shape = Circle V2 Double
           | Polygon [V2]
#-}

{-# COMPILE GHC Shape = data Shape (Circle | Polygon) #-}
