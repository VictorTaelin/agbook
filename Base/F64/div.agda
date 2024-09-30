module Base.F64.div where

open import Base.F64.F64

primitive primFloatDiv : F64 → F64 → F64

-- Division of floats.
-- - x: The dividend.
-- - y: The divisor.
-- = The quotient of x divided by y.
div : F64 → F64 → F64
div = primFloatDiv

-- infix version of div
infixl 7 _/_
_/_ : F64 → F64 → F64
_/_ = div
