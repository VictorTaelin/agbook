module Base.V2.add where

import Base.F64.add as F64
open import Base.F64.F64
open import Base.V2.V2

-- Adds two V2 vectors.
-- - 1st: The first V2 vector.
-- - 2nd: The second V2 vector.
-- = A new V2 vector with the sum of the coordinates.
add : V2 -> V2 -> V2
add (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (F64.add x1 x2) (F64.add y1 y2)

-- Infix operator for adding two V2 vectors.
_+_ : V2 -> V2 -> V2
_+_ = add

infixl 6 _+_
