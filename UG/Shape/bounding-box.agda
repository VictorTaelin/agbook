module UG.Shape.bounding-box where

open import Base.F64.add
open import Base.F64.max
open import Base.F64.min
open import Base.F64.sub
open import Base.List.List
open import Base.List.foldl
open import Base.List.map
open import Base.QuadTree.Rectangle.Rectangle
open import Base.V2.V2
open import UG.Shape.Shape

bounding-box : Shape → Rectangle
bounding-box (Circle center radius) = MkRectangle ((V2.x center) - radius) ((V2.y center) - radius) ((V2.x center + radius)) ((V2.y center) + radius)
bounding-box (Polygon []) = MkRectangle 0.0 0.0 0.0 0.0
bounding-box (Polygon (p :: ps)) = do
  let min-x = foldl min (V2.x p) (map (λ v → (V2.x v)) ps)
  let min-y = foldl min (V2.y p) (map (λ v → (V2.y v)) ps)
  let max-x = foldl max (V2.x p) (map (λ v → (V2.x v)) ps)
  let max-y = foldl max (V2.y p) (map (λ v → (V2.y v)) ps)
  MkRectangle min-x min-y max-x max-y

