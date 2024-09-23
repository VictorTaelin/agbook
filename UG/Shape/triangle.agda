module UG.Shape.triangle where

open import Base.List.Type
open import Base.List.append
open import Base.V2.Type
open import UG.Shape.Type

triangle : V2 → V2 → V2 → Shape
triangle v1 v2 v3 = Polygon (v1 :: v2 :: v3 :: [])
