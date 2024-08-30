module V2.perpendicular where

open import V2.Main
open import Float.Main

-- Calculates a vector perpendicular to the given V2 vector
-- - v: the V2 vector
-- = a new V2 vector perpendicular to v (rotated 90 degrees counterclockwise)
perpendicular : V2 → V2
perpendicular (MkV2 x y) = MkV2 (primFloatNegate y) x