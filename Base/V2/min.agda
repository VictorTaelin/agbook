module Base.V2.min where

import Base.F64.min as F64
open import Base.F64.Type
open import Base.V2.Type

min : V2 -> V2 -> V2
min (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (F64.min x1 x2) (F64.min y1 y2)
