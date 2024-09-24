module Base.Float.square where

open import Base.Float.Type
open import Base.Float.mul

-- Squares a float.
-- - x: The number to square.
-- = The square of x (x^2).
square : Float -> Float
square x = mul x x
