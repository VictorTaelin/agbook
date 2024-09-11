module Data.V2.length where

open import Data.V2.Type
open import Data.Float.mul
open import Data.Float.add
open import Data.Float.sqrt
open import Data.Float.Type

-- Calculates the length (magnitude) of a V2 vector.
-- - v: The V2 vector.
-- = The length of the vector.
length : V2 → Float
length (MkV2 x y) = sqrt ((x * x) + (y * y))
