module Data.Float.or where

open import Data.Float.Type
open import Data.Bool.Type
import Data.Bool.or as Bool

-- performs bitwise OR on two floats.
-- - x: the 1st float.
-- - y: the 2nd float.
-- = True if either x or y (or both) are non-zero, False otherwise.
or : Float → Float → Bool
or x y = Bool.or (primFloatLess 0.0 x) (primFloatLess 0.0 y)
