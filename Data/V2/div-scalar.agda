module Data.V2.div-scalar where

open import Data.V2.Type
open import Data.Float.Type
open import Data.Float.div

-- Divides a V2 vector by a scalar.
-- - v: The V2 vector to be divided.
-- - s: The scalar (Float) to divide by.
-- = A new V2 vector with both components divided by the scalar.
div-scalar : V2 → Float → V2
div-scalar (MkV2 x y) s = MkV2 (x / s) (y / s)
