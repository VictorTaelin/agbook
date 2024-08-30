module V2.div_scalar where

open import V2.Main
open import Float.Main
open import Float.Operations

-- Divides a V2 vector by a scalar
-- - v: the V2 vector to be divided
-- - s: the scalar (Float) to divide by
-- = a new V2 vector with both components divided by the scalar
div_scalar : V2 → Float → V2
div_scalar (MkV2 x y) s = MkV2 (x f/ s) (y f/ s)
