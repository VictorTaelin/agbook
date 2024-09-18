module Base.Float.max where

open import Base.Bool.if
open import Base.Float.Type

-- Returns the maximum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The larger of x and y.
max : Float → Float → Float
max x y = if primFloatLess x y then y else x
