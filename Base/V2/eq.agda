module Base.V2.eq where

import Base.F64.eq as F64
open import Base.Bool.Type
open import Base.Bool.and
open import Base.F64.Type
open import Base.V2.Type

eq : V2 -> V2 -> Bool
eq (MkV2 x1 y1) (MkV2 x2 y2) = (x1 F64.== x2) && (y1 F64.== y2)

infix 4 _==_
_==_ : V2 -> V2 -> Bool
_==_ = eq

