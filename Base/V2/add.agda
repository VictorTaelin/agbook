module Base.V2.add where

import Base.Float.add as Float
open import Base.Float.Type
open import Base.V2.Type

-- Adds two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = A new V2 vector with the sum of the coordinates.
add : V2 -> V2 -> V2
add (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 Float.+ x2) (y1 Float.+ y2)

infixl 6 _+_
_+_ : V2 -> V2 -> V2
_+_ = add
