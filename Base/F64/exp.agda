module Base.F64.exp where

open import Base.F64.F64

primitive primFloatPow : F64 → F64 → F64

-- Exponentiation of floats.
-- - x: The base float.
-- - y: The exponent float.
-- = The result of raising x to the power of y.
exp : F64 → F64 → F64
exp = primFloatPow

-- infix version of exp
infixr 8 _^_
_^_ : F64 → F64 → F64
_^_ = exp
