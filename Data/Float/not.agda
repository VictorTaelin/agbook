module Data.Float.not where

open import Data.Float.Type

-- negates a float 
-- - x: The float to negate
-- = The negated value of x
not : Float → Float
not = primFloatNegate
 