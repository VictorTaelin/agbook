module Base.V2.sub where

import Base.F64.sub as F64
open import Base.V2.Type

-- Subtracts one V2 vector from another.
-- - v1: The first V2 vector (minuend).
-- - v2: The second V2 vector (subtrahend).
-- = A new V2 vector representing the difference between v1 and v2.
sub : V2 -> V2 -> V2
sub (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 F64.- x2) (y1 F64.- y2)

infix 6 _-_
_-_ = sub
