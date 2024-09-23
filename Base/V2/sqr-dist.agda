module Base.V2.sqr-dist where

open import Base.Float.Type
open import Base.Float.add
open import Base.Float.mul
open import Base.Float.sub
open import Base.V2.Type

-- Calculates the squared distance between two V2 vectors.
-- - v1: The first V2 vector.
-- - v2: The second V2 vector.
-- = The squared distance between v1 and v2.
sqr-dist : V2 -> V2 -> Float
sqr-dist (MkV2 x1 y1) (MkV2 x2 y2) =  do
  let dx = x2 - x1
  let dy = y2 - y1
  (dx * dx) + (dy * dy)
