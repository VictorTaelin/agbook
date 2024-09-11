module Data.Float.min where

open import Data.Float.Type
open import Data.Bool.if

-- Returns the minimum of two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The smaller of x and y.
min : Float → Float → Float
min x y = if primFloatLess x y then x else y
