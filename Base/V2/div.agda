module Base.V2.div where

import Base.F64.div as F64
open import Base.V2.Type

-- Divides one V2 vector by another.
-- - v1: The dividend V2 vector.
-- - v2: The divisor V2 vector.
-- = A new V2 vector representing the component-wise division of v1 by v2.
div : V2 -> V2 -> V2
div (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 F64./ x2) (y1 F64./ y2)

infixl 7 _/_
_/_ : V2 -> V2 -> V2
_/_ = div
