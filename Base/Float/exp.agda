module Base.Float.exp where

open import Base.Float.Type

primitive
  primFloatPow : Float → Float → Float

-- Exponentiation of floats.
-- - x: The base float.
-- - y: The exponent float.
-- = The result of raising x to the power of y.
exp : Float → Float → Float
exp = primFloatPow

-- infix version of exp
infixr 8 _^_
_^_ : Float → Float → Float
_^_ = exp
