module Data.V2.sqr-dist where

open import Data.V2.Type
open import Data.Float.Type
open import Data.Float.sub
open import Data.Float.mul
open import Data.Float.add

-- Calculates the squared distance between two V2 vectors.
-- - v1: The first V2 vector.
-- - v2: The second V2 vector.
-- = The squared distance between v1 and v2.
sqr-dist : V2 → V2 → Float
sqr-dist (MkV2 x1 y1) (MkV2 x2 y2) = 
  let dx = x2 - x1
      dy = y2 - y1
  in (dx * dx) + (dy * dy)
