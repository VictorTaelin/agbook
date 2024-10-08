module UG.Shape.show where

import Base.F64.show as F64
import Base.List.show as List
import Base.V2.show as V2
open import Base.String.String
open import Base.String.append
open import Base.V2.Trait.Show
open import Base.V2.V2
open import UG.Shape.Shape

show : Shape → String
show (Circle c r) = "Circle: center = " ++ (V2.show c) ++ " radius = " ++ (F64.show r)
show (Polygon c v)  = "Polygon: center = " ++ (V2.show c) ++ " vertices = " ++ List.show v

