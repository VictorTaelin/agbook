module Base.V2.dist where

open import Base.Float.Type
open import Base.Float.sqrt
open import Base.V2.Type
open import Base.V2.sqr-dist

-- Calculates the Euclidean distance between two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = The distance between v1 and v2.
dist : V2 -> V2 -> Float
dist v1 v2 = sqrt (sqr-dist v1 v2)
