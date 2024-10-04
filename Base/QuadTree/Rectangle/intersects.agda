module Base.QuadTree.Rectangle.intersects where

open import Base.Bool.Bool
open import Base.Bool.not
open import Base.Bool.or
open import Base.F64.gt
open import Base.F64.lt
open import Base.QuadTree.Rectangle.Rectangle

intersects : Rectangle → Rectangle → Bool
intersects r1 r2 = do
  let x11 = Rectangle.min-x r1
  let y11 = Rectangle.min-y r1
  let x12 = Rectangle.max-x r1
  let y12 = Rectangle.max-y r1
  let x21 = Rectangle.min-x r2
  let y21 = Rectangle.min-y r2
  let x22 = Rectangle.max-x r2
  let y22 = Rectangle.max-y r2
  not ((x12 < x21) || (x11 > x22) || (y12 < y21) || (y11 > y22))

