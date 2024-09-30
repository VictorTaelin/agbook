module Base.F64.cos where

open import Base.F64.F64

primitive primFloatCos : F64 → F64

-- Cosine function for floats.
-- - x: The angle in radians.
-- = The cosine of x.
cos : F64 → F64
cos = primFloatCos
