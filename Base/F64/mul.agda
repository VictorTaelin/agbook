module Base.F64.mul where

open import Base.F64.F64

primitive primFloatTimes : F64 → F64 → F64

-- Multiplication of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The product of x and y.
mul : F64 → F64 → F64
mul = primFloatTimes

-- infix version of mul
infixl 7 _*_
_*_ : F64 → F64 → F64
_*_ = mul

