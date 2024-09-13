module UG.Shape.triangle where

open import UG.Shape.Type
open import Data.V2.Type
open import Data.List.Type
open import Data.List.append

triangle : V2 → V2 → V2 → Shape
triangle v1 v2 v3 = Polygon (v1 :: v2 :: v3 :: [])
