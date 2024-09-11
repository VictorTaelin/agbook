module Data.Float.xor where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.xor

-- Performs bitwise XOR on two floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = True if exactly one of x and y is non-zero, False otherwise.
float-xor : Float → Float → Bool
float-xor x y = xor (primFloatLess 0.0 x) (primFloatLess 0.0 y)
 