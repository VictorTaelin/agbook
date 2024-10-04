module Base.QuadTree.Rectangle.Rectangle where

open import Base.F64.F64

record Rectangle : Set where
  constructor MkRectangle
  field
    min-x : F64
    min-y : F64
    max-x : F64
    max-y : F64

