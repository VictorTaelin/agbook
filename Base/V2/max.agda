module Base.V2.max where

import Base.Float.max as Float
open import Base.Float.Type
open import Base.V2.Type

max : V2 -> V2 -> V2
max (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (Float.max x1 x2) (Float.max y1 y2)
