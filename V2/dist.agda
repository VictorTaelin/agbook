module V2.dist where

open import V2.Main
open import V2.sqr_dist
open import Float.Main
open import Float.Operations

-- Calculates the Euclidean distance between two V2 vectors.
-- - v1: the 1st V2 vector.
-- - v2: the 2nd V2 vector.
-- = The distance between v1 and v2.
dist : V2 → V2 → Float
dist v1 v2 = fsqrt (sqr_dist v1 v2)
