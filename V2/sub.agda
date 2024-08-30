module V2.sub where

open import V2.Main
open import Float.Operations

-- Subtracts one V2 vector from another
-- - v1: the first V2 vector (minuend)
-- - v2: the second V2 vector (subtrahend)
-- = a new V2 vector representing the difference between v1 and v2
sub_v2 : V2 → V2 → V2
sub_v2 (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 f- x2) (y1 f- y2)