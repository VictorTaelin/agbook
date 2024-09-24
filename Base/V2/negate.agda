module Base.V2.negate where

import Base.Float.negate as Float
open import Base.Float.Type
open import Base.V2.Type

-- Negates a V2 vector.
-- - v: The V2 vector to negate.
-- = A new V2 vector with negated coordinates.
negate : V2 -> V2
negate (MkV2 x y) = MkV2 (Float.negate x) (Float.negate y)

-- Infix notation for negate
infix 9 -_
-_ : V2 -> V2
-_ = negate
