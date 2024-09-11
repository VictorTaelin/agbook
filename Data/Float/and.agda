module Data.Float.and where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.and

-- Performs bitwise AND on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The result of bitwise AND on x and y.
float-and : Float → Float → Bool
float-and x y = and (primFloatLess 0.0 x) (primFloatLess 0.0 y)

-- The infix version of float-and.
infixl 6 _&_
_&_ : Float → Float → Bool
_&_ = float-and