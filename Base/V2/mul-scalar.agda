module Base.V2.mul-scalar where

open import Base.F64.Type
import Base.F64.mul as F64
open import Base.V2.Type

-- Multiplies a V2 vector by a scalar.
-- - v: The V2 vector to be multiplied.
-- - s: The scalar (F64) to multiply by.
-- = A new V2 vector with both components multiplied by the scalar.
mul-scalar : V2 -> F64 -> V2
mul-scalar (MkV2 x y) s = MkV2 (x F64.* s) (y F64.* s)

-- Infix operator for multiplying a V2 vector by a scalar.
_*_ : V2 -> F64 -> V2
_*_ = mul-scalar

infixl 7 _*_

