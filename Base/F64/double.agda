module Base.F64.double where

open import Base.F64.F64
open import Base.F64.add

-- Doubles a float.
-- - x: The number to double.
-- = The double of x.
double : F64 → F64
double x = add x x

