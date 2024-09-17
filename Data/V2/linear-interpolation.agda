module Data.V2.linear-interpolation where

open import Data.V2.Type
open import Data.Float.Type
open import Data.Float.Operations
open import Data.V2.add
open import Data.V2.sub
open import Data.V2.mul-scalar

-- Performs linear interpolation between two V2 vectors.
-- - v1: The starting V2 vector.
-- - v2: The ending V2 vector.
-- - t: The interpolation parameter (0.0 ≤ t ≤ 1.0).
-- = The interpolated V2 vector.
linear-interpolation : V2 → V2 → Float → V2
linear-interpolation v1 v2 t = 
  add_v2 v1 (mul-scalar (sub_v2 v2 v1) t)
