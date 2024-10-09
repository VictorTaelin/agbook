module Base.F64.asin where

open import Base.F64.F64

primitive primFloatASin : F64 → F64

-- Arcsine (inverse sine) function for floats.
-- - x: The value to compute arcsine for, in the range [-1, 1].
-- = The arcsine of x in radians, in the range [-π/2, π/2].
asin : F64 → F64
asin = primFloatASin

