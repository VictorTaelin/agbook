module Base.F64.negate where

open import Base.F64.F64

primitive primFloatNegate : F64 → F64

-- Negates a float 
-- - x: The float to negate
-- = The negated value of x
negate : F64 → F64
negate = primFloatNegate
