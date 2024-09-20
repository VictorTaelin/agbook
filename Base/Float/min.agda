module Base.Float.min where

open import Base.Bool.if
open import Base.Float.Type
open import Base.Float.lt

-- Returns the minimum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The smaller of x and y.
min : Float → Float → Float
min x y = if lt x y then x else y
