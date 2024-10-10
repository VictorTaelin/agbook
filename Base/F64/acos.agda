module Base.F64.acos where

open import Base.F64.F64

primitive primFloatACos : F64 → F64

-- Arccosine (inverse cosine) function for floats.
-- - x: The value to compute arccosine for, in the range [-1, 1].
-- = The arccosine of x in radians, in the range [0, π].
acos : F64 → F64
acos = primFloatACos

