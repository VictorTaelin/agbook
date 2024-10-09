module Base.F64.min where

open import Base.Bool.if
open import Base.F64.F64
open import Base.F64.lt

-- Returns the minimum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The smaller of x and y.
min : F64 → F64 → F64
min x y = if lt x y then x else y

