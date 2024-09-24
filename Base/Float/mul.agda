module Base.Float.mul where

open import Base.Float.Type

primitive
  primFloatTimes : Float -> Float -> Float

-- Multiplication of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The product of x and y.
mul : Float -> Float -> Float
mul = primFloatTimes

-- infix version of mul
infixl 7 _*_
_*_ : Float -> Float -> Float
_*_ = mul 
