module Base.V2.sqr-dist where

open import Base.F64.F64
open import Base.F64.add
open import Base.F64.mul
open import Base.F64.sub
open import Base.V2.V2

-- Calculates the squared distance between two V2 vectors.
-- - 1st: The first V2 vector.
-- - 2nd: The second V2 vector.
-- = The squared distance between the two vectors.
sqr-dist : V2 → V2 → F64
sqr-dist (MkV2 x1 y1) (MkV2 x2 y2) =  do
  let dx = x2 - x1
  let dy = y2 - y1
  (dx * dx) + (dy * dy)