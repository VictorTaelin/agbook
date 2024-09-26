module Base.F64.tan where

open import Base.F64.F64

primitive primFloatTan : F64 -> F64

-- Tangent function for floats.
-- - x: The angle in radians.
-- = The tangent of x.
tan : F64 -> F64
tan = primFloatTan
