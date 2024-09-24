module Base.F64.sinh where

open import Base.F64.Type

primitive primFloatSinh : F64 -> F64

-- Hyperbolic sine function for floats.
-- - x: The input value.
-- = The hyperbolic sine of x.
sinh : F64 -> F64
sinh = primFloatSinh
