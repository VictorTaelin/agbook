module Data.Float.not where

open import Data.Float.Type
open import Data.Bool.Type
open import Data.Bool.not

-- negates a float 
-- - x: The float to negate
-- = The negated value of x
float-not : Float → Bool
float-not x = not (primFloatLess 0.0 x)
