module Base.V2.eq where

import Base.Float.eq as Float
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Float.Type
open import Base.V2.Type

eq : V2 -> V2 -> Bool
eq (MkV2 x1 y1) (MkV2 x2 y2) = (x1 Float.== x2) && (y1 Float.== y2)

infix 4 _==_
_==_ : V2 -> V2 -> Bool
_==_ = eq

