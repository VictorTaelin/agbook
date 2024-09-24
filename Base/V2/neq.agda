module Base.V2.neq where

import Base.F64.eq as F64
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Bool.not
open import Base.F64.Type
open import Base.V2.Type

neq : V2 -> V2 -> Bool
neq (MkV2 x1 y1) (MkV2 x2 y2) = not ((x1 F64.== x2) && (y1 F64.== y2))

infix 4 _!=_
_!=_ : V2 -> V2 -> Bool
_!=_ = neq
