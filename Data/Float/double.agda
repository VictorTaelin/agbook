module Data.Float.double where

open import Data.Float.add
open import Data.Float.Type

-- Doubles a float.
-- - x: The number to double.
-- = The double of x.
double : Float → Float
double x = primFloatPlus x x
