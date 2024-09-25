module Base.V2.div where

import Base.F64.div as F64
open import Base.V2.Type

-- Divides one V2 vector by another component-wise.
-- - 1st: The dividend V2 vector.
-- - 2nd: The divisor V2 vector.
-- = A new V2 vector representing the component-wise division of the 1st by the 2nd.
div : V2 -> V2 -> V2
div (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 F64./ x2) (y1 F64./ y2)

-- Infix operator for div two V2.
_/_ : V2 -> V2 -> V2
_/_ = div

infixl 7 _/_
