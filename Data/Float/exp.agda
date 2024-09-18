module Data.Float.exp where

open import Data.Float.Type

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
