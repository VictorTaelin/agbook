module Data.V2.dot where

open import Data.V2.Type
open import Data.Float.Operations
open import Data.Float.Type

-- Calculates the dot product of two V2 vectors.
-- - v1: The first V2 vector.
-- - v2: The second V2 vector.
-- = The dot product (scalar) of v1 and v2.
dot : V2 → V2 → Float
dot (MkV2 x1 y1) (MkV2 x2 y2) = (x1 f* x2) f+ (y1 f* y2)
