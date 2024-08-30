module Data.V2.length where

open import Data.V2.Main
open import Data.Float.Operations
open import Data.Float.Main

-- Calculates the length (magnitude) of a V2 vector.
-- - v: The V2 vector.
-- = The length of the vector.
length : V2 → Float
length (MkV2 x y) = fsqrt ((x f* x) f+ (y f* y))
