module Base.V2.negate where

import Base.F64.negate as F64
open import Base.F64.F64
open import Base.V2.V2

-- Negates a V2 vector.
-- - 1st: The V2 vector to negate.
-- = A new V2 vector with negated coordinates.
negate : V2 → V2
negate (MkV2 x y) = MkV2 (F64.negate x) (F64.negate y)

-- Infix notation for negate.
-_ : V2 → V2
-_ = negate

infix 9 -_
