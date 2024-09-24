module Base.F64.atan where

open import Base.F64.Type

primitive primFloatATan : F64 -> F64

-- Arctangent (inverse tangent) function for floats.
-- - x: The value to compute arctangent for.
-- = The arctangent of x in radians, in the range [-π/2, π/2].
atan : F64 -> F64
atan = primFloatATan
