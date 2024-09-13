module UG.Shape.circle where

open import Data.V2.Type 
open import Data.Float.Type
open import UG.Shape.Type

circle : V2 → Float → Shape
circle center radius = Circle center radius
