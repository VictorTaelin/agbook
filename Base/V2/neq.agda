module Base.V2.neq where

import Base.Float.eq as Float
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Bool.not
open import Base.Float.Type
open import Base.V2.Type

neq : V2 -> V2 -> Bool
neq (MkV2 x1 y1) (MkV2 x2 y2) = not ((x1 Float.== x2) && (y1 Float.== y2))

infix 4 _!=_
_!=_ : V2 -> V2 -> Bool
_!=_ = neq
