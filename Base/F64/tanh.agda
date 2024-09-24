module Base.F64.tanh where

open import Base.F64.Type

primitive primFloatTanh : F64 -> F64

-- Hyperbolic tangent function for floats.
-- - x: The input value.
-- = The hyperbolic tangent of x.
tanh : F64 -> F64
tanh = primFloatTanh
