module Base.V2.dot where

open import Base.F64.Type
open import Base.F64.add
open import Base.F64.mul
open import Base.V2.Type

-- Calculates the dot product of two V2 vectors.
-- - v1: The 1 V2 vector.
-- - v2: The second V2 vector.
-- = The dot product (scalar) of v1 and v2.
dot : V2 -> V2 -> F64
dot (MkV2 x1 y1) (MkV2 x2 y2) = (x1 * x2) + (y1 * y2)
