module Base.F64.square where

open import Base.F64.Type
open import Base.F64.mul

-- Squares a float.
-- - x: The number to square.
-- = The square of x (x^2).
square : F64 -> F64
square x = mul x x
