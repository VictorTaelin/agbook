module Data.V2.div_scalar where

open import Data.V2.Main
open import Data.Float.Main
open import Data.Float.Operations

-- Divides a V2 vector by a scalar.
-- - v: The V2 vector to be divided.
-- - s: The scalar (Float) to divide by.
-- = A new V2 vector with both components divided by the scalar.
div_scalar : V2 → Float → V2
div_scalar (MkV2 x y) s = MkV2 (x f/ s) (y f/ s)
