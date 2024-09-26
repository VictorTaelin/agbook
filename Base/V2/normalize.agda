module Base.V2.normalize where

open import Base.V2.V2
open import Base.V2.div-scalar
open import Base.V2.length

-- Normalizes a V2 vector (makes it a unit vector).
-- - 1st: The V2 vector to normalize.
-- = A new V2 vector with the same direction but unit length.
normalize : V2 -> V2
normalize v = do
  let len = length v
  div-scalar v len