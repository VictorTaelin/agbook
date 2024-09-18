module Base.Float.sqrt where

open import Base.Float.Type

-- Computes the square root of a float.
-- Returns NaN for negative numbers.
-- - x: The float to take the square root of.
-- = The square root of x.
sqrt : Float → Float
sqrt = primFloatSqrt
