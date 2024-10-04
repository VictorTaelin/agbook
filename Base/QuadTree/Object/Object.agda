module Base.QuadTree.Object.Object where

open import Base.QuadTree.Rectangle.Rectangle

record Object (A : Set) : Set where
  constructor MkObject
  field
    bounds : Rectangle
    value  : A

