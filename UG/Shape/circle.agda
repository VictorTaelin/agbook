module UG.Shape.circle where

open import Base.Float.Type
open import Base.V2.Type 
open import UG.Shape.Type

circle : V2 -> Float -> Shape
circle center radius = Circle center radius
