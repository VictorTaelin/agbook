module Base.F64.max where

open import Base.Bool.if
open import Base.F64.F64
open import Base.F64.lt

-- Returns the maximum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The larger of x and y.
max : F64 → F64 → F64
max x y = if lt x y then y else x
