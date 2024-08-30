module V2.mul_scalar where

open import V2.Main
open import Float.Main
open import Float.Operations

-- Multiplies a V2 vector by a scalar
-- - v: the V2 vector to be multiplied
-- - s: the scalar (Float) to multiply by
-- = a new V2 vector with both components multiplied by the scalar
mul_scalar : V2 → Float → V2
mul_scalar (MkV2 x y) s = MkV2 (x f* s) (y f* s)
