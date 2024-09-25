module Base.V2.eq where

import Base.F64.eq as F64
open import Base.Bool.Type
open import Base.Bool.and
open import Base.F64.Type
open import Base.V2.Type

-- Checks if two V2 vectors are equal.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = True if v1 and v2 are equal, False otherwise.
eq : V2 -> V2 -> Bool
eq (MkV2 x1 y1) (MkV2 x2 y2) = (x1 F64.== x2) && (y1 F64.== y2)

-- Infix operator for equality check of V2 vectors.
_==_ : V2 -> V2 -> Bool
_==_ = eq

infix 4 _==_

