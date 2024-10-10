module Base.V2.lerp where

open import Base.F64.F64

open import Base.V2.V2
open import Base.V2.add
open import Base.V2.mul-scalar
open import Base.V2.sub

-- Performs linear interpolation between two V2 vectors.
-- - 1st: The starting V2 vector.
-- - 2nd: The ending V2 vector.
-- - 3rd: The interpolation parameter (0.0 ≤ t ≤ 1.0).
-- = A new V2 vector representing the interpolated result.
lerp : V2 → V2 → F64 → V2
lerp v1 v2 t = v1 + (mul-scalar (v2 - v1) t)

