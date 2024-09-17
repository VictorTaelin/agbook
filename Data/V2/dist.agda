module Data.V2.dist where

open import Data.V2.Type
open import Data.V2.sqr-dist
open import Data.Float.Type
open import Data.Float.Operations

-- Calculates the Euclidean distance between two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = The distance between v1 and v2.
dist : V2 → V2 → Float
dist v1 v2 = fsqrt (sqr-dist v1 v2)
