module Base.V2.div-scalar where

open import Base.F64.F64
open import Base.F64.div
open import Base.V2.V2

-- Divides a V2 vector by a scalar.
-- - 1st: The V2 vector to be divided.
-- - 2nd: The scalar (F64) to divide by.
-- = A new V2 vector with both components divided by the scalar.
div-scalar : V2 → F64 → V2
div-scalar (MkV2 x y) s = MkV2 (x / s) (y / s)