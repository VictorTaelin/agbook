module V2.length where

open import V2.Main
open import Float.Operations
open import Float.Main

-- Calculates the length (magnitude) of a V2 vector
-- - v: the V2 vector
-- = the length of the vector
length : V2 → Float
length (MkV2 x y) = fsqrt ((x f* x) f+ (y f* y))
