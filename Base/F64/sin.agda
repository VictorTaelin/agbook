module Base.F64.sin where

open import Base.F64.Type

primitive primFloatSin : F64 -> F64

-- Sine function for floats.
-- - x: The angle in radians.
-- = The sine of x.
sin : F64 -> F64
sin = primFloatSin
