module V2.sqr_dist where

open import V2.Main
open import Float.Main
open import Float.Operations

-- Calculates the squared distance between two V2 vectors
-- - v1: the first V2 vector
-- - v2: the second V2 vector
-- = the squared distance between v1 and v2
sqr_dist : V2 → V2 → Float
sqr_dist (MkV2 x1 y1) (MkV2 x2 y2) = 
  let dx = x2 f- x1
      dy = y2 f- y1
  in (dx f* dx) f+ (dy f* dy)
