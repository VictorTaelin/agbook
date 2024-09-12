module Data.Float.and where

open import Data.Float.Type
open import Data.Bool.Type
import Data.Bool.and as Bool
open import Data.Bool.not

-- Performs logical AND on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = true if both x and y are true.
and : Float → Float → Bool
and x y = Bool.and (not (primFloatEquality 0.0 x)) (not (primFloatEquality 0.0 y))

-- The infix version of and.
infixl 6 _&&_
_&&_ : Float → Float → Bool
_&&_ = and
