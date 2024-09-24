module Base.Float.double where

open import Base.Float.add
open import Base.Float.Type

-- Doubles a float.
-- - x: The number to double.
-- = The double of x.
double : Float -> Float
double x = add x x
