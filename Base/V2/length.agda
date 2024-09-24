module Base.V2.length where

open import Base.F64.Type
open import Base.F64.add
open import Base.F64.mul
open import Base.F64.sqrt
open import Base.V2.Type

-- Calculates the length (magnitude) of a V2 vector.
-- - v: The V2 vector.
-- = The length of the vector.
length : V2 -> F64
length (MkV2 x y) = sqrt ((x * x) + (y * y))
