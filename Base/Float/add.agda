module Base.Float.add where

open import Base.Float.Type

primitive
  primFloatPlus : Float → Float → Float

-- Addition of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The sum of x and y.
add : Float → Float → Float
add = primFloatPlus

-- The infix version of add.
infixl 6 _+_
_+_ : Float → Float → Float
_+_ = add
