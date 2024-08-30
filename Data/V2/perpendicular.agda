module Data.V2.perpendicular where

open import Data.V2.Main
open import Data.Float.Main

-- Calculates a vector perpendicular to the given V2 vector.
-- - v: The V2 vector.
-- = A new V2 vector perpendicular to v (rotated 90 degrees counterclockwise).
perpendicular : V2 → V2
perpendicular (MkV2 x y) = MkV2 (primFloatNegate y) x
