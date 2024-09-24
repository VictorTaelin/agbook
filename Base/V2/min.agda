module Base.V2.min where

import Base.Float.min as Float
open import Base.Float.Type
open import Base.V2.Type

min : V2 -> V2 -> V2
min (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (Float.min x1 x2) (Float.min y1 y2)
