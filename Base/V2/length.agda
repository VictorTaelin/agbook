module Base.V2.length where

open import Base.F64.F64
open import Base.F64.add
open import Base.F64.mul
open import Base.F64.sqrt
open import Base.V2.V2

-- Calculates the length (magnitude) of a V2 vector.
-- - 1st: The V2 vector.
-- = The length (magnitude) of the vector as an F64.
length : V2 → F64
length (MkV2 x y) = sqrt ((x * x) + (y * y))

