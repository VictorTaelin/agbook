module Base.Float.half where

open import Base.Float.Type

-- Halves the given float.
-- - x: The number to half.
-- = The result of x/2.
half : Float → Float
half x = primFloatDiv x 2.0
