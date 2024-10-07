module Base.QuadTree.Rectangle.subdivide where

open import Base.QuadTree.Rectangle.Rectangle
open import Base.Pair.Pair
open import Base.F64.div
open import Base.F64.add

subdivide : Rectangle → Pair (Pair Rectangle Rectangle) (Pair Rectangle Rectangle)
subdivide r = do
  let x1 = Rectangle.min-x r
  let y1 = Rectangle.min-y r
  let x2 = Rectangle.max-x r
  let y2 = Rectangle.max-y r
  let mid-x = (x1 + x2) / 2.0
  let mid-y = (y1 + y2) / 2.0
  let ne = MkRectangle mid-x mid-y x2 y2
  let nw = MkRectangle x1 mid-y mid-x y2
  let sw = MkRectangle x1 y1 mid-x mid-y
  let se = MkRectangle mid-x y1 x2 mid-y
  ( ne , nw ) , (sw , se)


