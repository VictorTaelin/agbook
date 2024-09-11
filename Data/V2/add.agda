module Data.V2.add where

open import Data.V2.Type
open import Data.Float.add
open import Data.Float.Type

-- Adds two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = A new V2 vector with the sum of the coordinates.
add : V2 → V2 → V2
add (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 + x2) (y1 + y2)
