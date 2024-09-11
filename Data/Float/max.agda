module Data.Float.max where

open import Data.Float.Type
open import Data.Bool.if

-- Returns the maximum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The larger of x and y.
max : Float → Float → Float
max x y = if primFloatLess x y then y else x
