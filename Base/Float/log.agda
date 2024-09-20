module Base.Float.log where

open import Base.Float.Type

primitive
  primFloatLog : Float → Float

-- Returns the natural logarithm of a floating point number.
-- - x: The floating point number.
-- = The natural logarithm of x.
log : Float → Float
log = primFloatLog
