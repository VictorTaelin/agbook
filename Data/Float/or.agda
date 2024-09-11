module Data.Float.or where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.or

-- performs bitwise OR on two floats.
-- - x: the 1st float.
-- - y: the 2nd float.
-- = True if either x or y (or both) are non-zero, False otherwise.
float-or : Float → Float → Bool
float-or x y = or (primFloatLess 0.0 x) (primFloatLess 0.0 y)
