module V2.normalize where

open import V2.Main
open import Float.Operations
open import V2.length
open import V2.div_scalar

-- Normalizes a V2 vector (makes it a unit vector)
-- - v: the V2 vector to normalize
-- = a new V2 vector with the same direction but unit length
normalize : V2 → V2
normalize v = 
  let len = length v
  in div_scalar v len