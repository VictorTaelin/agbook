module Base.F64.log where

open import Base.F64.F64

primitive primFloatLog : F64 → F64

-- Returns the natural logarithm of a floating point number.
-- - x: The floating point number.
-- = The natural logarithm of x.
log : F64 → F64
log = primFloatLog
