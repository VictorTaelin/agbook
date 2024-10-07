module Base.QuadTree.Rectangle.point-in where

open import Base.Bool.Bool
open import Base.Bool.and
open import Base.F64.gte
open import Base.F64.lte
open import Base.QuadTree.Rectangle.Rectangle
open import Base.V2.V2

point-in : V2 → Rectangle → Bool
point-in p r = do
  let xp = V2.x p
  let yp = V2.y p
  let x1 = Rectangle.min-x r
  let y1 = Rectangle.min-y r
  let x2 = Rectangle.max-x r
  let y2 = Rectangle.max-y r
  (xp >= x1) && (xp <= x2) && (yp >= y1) && (yp <= y2)

