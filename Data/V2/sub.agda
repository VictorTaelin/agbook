module Data.V2.sub where

open import Data.V2.Type
open import Data.Float.sub

-- Subtracts one V2 vector from another.
-- - v1: The first V2 vector (minuend).
-- - v2: The second V2 vector (subtrahend).
-- = A new V2 vector representing the difference between v1 and v2.
sub : V2 → V2 → V2
sub (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 - x2) (y1 - y2)
