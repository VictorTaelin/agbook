module Base.V2.perpendicular where

open import Base.F64.F64
open import Base.F64.negate
open import Base.V2.V2

-- Calculates a vector perpendicular to the given V2 vector.
-- - 1st: The input V2 vector.
-- = A new V2 vector perpendicular to the input (rotated 90 degrees counterclockwise).
perpendicular : V2 -> V2
perpendicular (MkV2 x y) = MkV2 (negate y) x