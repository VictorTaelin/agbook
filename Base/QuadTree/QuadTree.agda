module Base.QuadTree.QuadTree where

open import Base.List.List
open import Base.QuadTree.Object.Object
open import Base.QuadTree.Rectangle.Rectangle

data QuadTree (A : Set) : Set where
  Empty : Rectangle → QuadTree A
  Leaf  : Rectangle → List (Object A) → QuadTree A
  Node  : Rectangle → QuadTree A → QuadTree A → QuadTree A → QuadTree A → QuadTree A


