module Base.V2.sqr-dist where

open import Base.F64.Type
open import Base.F64.add
open import Base.F64.mul
open import Base.F64.sub
open import Base.V2.Type

-- Calculates the squared distance between two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = The squared distance between v1 and v2.
sqr-dist : V2 -> V2 -> F64
sqr-dist (MkV2 x1 y1) (MkV2 x2 y2) =  do
  let dx = x2 - x1
  let dy = y2 - y1
  (dx * dx) + (dy * dy)
