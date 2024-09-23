module Base.V2.length where

open import Base.Float.Type
open import Base.Float.add
open import Base.Float.mul
open import Base.Float.sqrt
open import Base.V2.Type

-- Calculates the length (magnitude) of a V2 vector.
-- - v: The V2 vector.
-- = The length of the vector.
length : V2 -> Float
length (MkV2 x y) = sqrt ((x * x) + (y * y))
