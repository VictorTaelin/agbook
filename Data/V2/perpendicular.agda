module Data.V2.perpendicular where

open import Data.V2.Type
open import Data.Float.negate

-- Calculates a vector perpendicular to the given V2 vector.
-- - v: The V2 vector.
-- = A new V2 vector perpendicular to v (rotated 90 degrees counterclockwise).
perpendicular : V2 → V2
perpendicular (MkV2 x y) = MkV2 (negate y) x
