module Base.V2.dot where

open import Base.Float.Type
open import Base.Float.add
open import Base.Float.mul
open import Base.V2.Type

-- Calculates the dot product of two V2 vectors.
-- - v1: The first V2 vector.
-- - v2: The second V2 vector.
-- = The dot product (scalar) of v1 and v2.
dot : V2 -> V2 -> Float
dot (MkV2 x1 y1) (MkV2 x2 y2) = (x1 * x2) + (y1 * y2)
