module Data.Float.sqrt where

open import Data.Float.Type

-- Computes the square root of a float.
-- Note: This function is not defined for negative numbers.
-- - x: The float to take the square root of.
-- = The square root of x.
sqrt : Float → Float
sqrt = primFloatSqrt
