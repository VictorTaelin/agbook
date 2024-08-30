module Data.V2.add where

open import Data.V2.Main
open import Data.Float.Operations
open import Data.Float.Main

-- Adds two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = A new V2 vector with the sum of the coordinates.
add_v2 : V2 → V2 → V2
add_v2 (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 f+ x2) (y1 f+ y2)
