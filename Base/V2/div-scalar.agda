module Base.V2.div-scalar where

open import Base.Float.Type
open import Base.Float.div
open import Base.V2.Type

-- Divides a V2 vector by a scalar.
-- - v: The V2 vector to be divided.
-- - s: The scalar (Float) to divide by.
-- = A new V2 vector with both components divided by the scalar.
div-scalar : V2 -> Float -> V2
div-scalar (MkV2 x y) s = MkV2 (x / s) (y / s)
