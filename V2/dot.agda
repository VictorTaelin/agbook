module V2.dot where

open import V2.Main
open import Float.Operations
open import Float.Main

-- Calculates the dot product of two V2 vectors
-- - v1: the first V2 vector
-- - v2: the second V2 vector
-- = the dot product (scalar) of v1 and v2
dot : V2 → V2 → Float
dot (MkV2 x1 y1) (MkV2 x2 y2) = (x1 f* x2) f+ (y1 f* y2)
