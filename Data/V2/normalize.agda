module Data.V2.normalize where

open import Data.V2.Main
open import Data.Float.Operations
open import Data.V2.length
open import Data.V2.div_scalar

-- Normalizes a V2 vector (makes it a unit vector).
-- - v: The V2 vector to normalize.
-- = A new V2 vector with the same direction but unit length.
normalize : V2 → V2
normalize v = 
  let len = length v
  in div_scalar v len
