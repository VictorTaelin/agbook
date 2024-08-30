module V2.linear_interpolation where

open import V2.Main
open import Float.Main
open import Float.Operations
open import V2.add
open import V2.sub
open import V2.mul_scalar

-- Performs linear interpolation between two V2 vectors
-- - v1: the starting V2 vector
-- - v2: the ending V2 vector
-- - t: the interpolation parameter (0.0 ≤ t ≤ 1.0)
-- = the interpolated V2 vector
linear_interpolation : V2 → V2 → Float → V2
linear_interpolation v1 v2 t = 
  add_v2 v1 (mul_scalar (sub_v2 v2 v1) t)
