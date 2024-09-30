module Base.V2.dist where

open import Base.F64.F64
open import Base.F64.sqrt
open import Base.V2.V2
open import Base.V2.sqr-dist

-- Calculates the Euclidean distance between two V2 vectors.
-- - 1st: The first V2 vector.
-- - 2nd: The second V2 vector.
-- = The distance between the two vectors.
dist : V2 → V2 → F64
dist v1 v2 = sqrt (sqr-dist v1 v2)
