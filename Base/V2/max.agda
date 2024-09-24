module Base.V2.max where

import Base.F64.max as F64
open import Base.F64.Type
open import Base.V2.Type

-- Computes the component-wise maximum of two V2 vectors.
-- - v1: The 1st V2 vector.
-- - v2: The 2nd V2 vector.
-- = A new V2 vector with each component being the maximum of the corresponding components of v1 and v2.
max : V2 -> V2 -> V2
max (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (F64.max x1 x2) (F64.max y1 y2)
