module Base.V2.mul-scalar where

open import Base.Float.Type
open import Base.Float.mul
open import Base.V2.Type

-- Multiplies a V2 vector by a scalar.
-- - v: The V2 vector to be multiplied.
-- - s: The scalar (Float) to multiply by.
-- = A new V2 vector with both components multiplied by the scalar.
mul-scalar : V2 -> Float -> V2
mul-scalar (MkV2 x y) s = MkV2 (x * s) (y * s)
