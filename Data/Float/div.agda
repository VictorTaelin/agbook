module Data.Float.div where

open import Data.Float.Type

-- Division of floats.
-- - x: The dividend.
-- - y: The divisor.
-- = The quotient of x divided by y.
div : Float → Float → Float
div = primFloatDiv

-- infix version of div
infixl 7 _/_
_/_ : Float → Float → Float
_/_ = div
