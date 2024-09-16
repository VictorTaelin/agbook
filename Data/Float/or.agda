module Data.Float.or where

open import Data.Bool.not
import Data.Bool.or as Bool
open import Data.Bool.Type
open import Data.Float.Type

-- Performs a logical OR on two floats.
-- - x: the 1st float.
-- - y: the 2nd float.
-- = True if either x or y (or both) are non-zero, False otherwise.
or : Float → Float → Bool
or x y = Bool.or (not (primFloatEquality 0.0 x)) (not (primFloatEquality 0.0 y))

infixl 5 _||_
_||_ : Float → Float → Bool
_||_ = or
