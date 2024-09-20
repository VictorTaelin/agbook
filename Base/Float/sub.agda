module Base.Float.sub where

open import Base.Float.Type

primitive
  primFloatMinus : Float → Float → Float

-- Subtraction of floats.
-- - x: The number to subtract from.
-- - y: The number to subtract.
-- = The result of x - y.

sub : Float → Float → Float
sub = primFloatMinus

-- infix version of sub
infixl 6 _-_
_-_ : Float → Float → Float
_-_ = sub
