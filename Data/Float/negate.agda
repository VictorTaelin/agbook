module Data.Float.negate where

open import Data.Float.Type

-- Negates a float 
-- - x: The float to negate
-- = The negated value of x
negate : Float → Float
negate = primFloatNegate
