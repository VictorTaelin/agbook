module Base.F64.sqrt where

open import Base.F64.Type

primitive primFloatSqrt : F64 -> F64

-- Computes the square root of a float.
-- Returns NaN for negative numbers.
-- - x: The float to take the square root of.
-- = The square root of x.
sqrt : F64 -> F64
sqrt = primFloatSqrt
