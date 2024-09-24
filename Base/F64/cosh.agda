module Base.F64.cosh where

open import Base.F64.Type

primitive primFloatCosh : F64 -> F64

-- Hyperbolic cosine function for floats.
-- - x: The input value.
-- = The hyperbolic cosine of x.
cosh : F64 -> F64
cosh = primFloatCosh
