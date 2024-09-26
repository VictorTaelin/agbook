module Base.F64.sub where

open import Base.F64.F64

primitive primFloatMinus : F64 -> F64 -> F64

-- Subtraction of floats.
-- - x: The number to subtract from.
-- - y: The number to subtract.
-- = The result of x - y.

sub : F64 -> F64 -> F64
sub = primFloatMinus

-- infix version of sub
infixl 6 _-_
_-_ : F64 -> F64 -> F64
_-_ = sub
