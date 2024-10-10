module Base.V2.max where

import Base.F64.max as F64
open import Base.F64.F64
open import Base.V2.V2

-- Computes the component-wise maximum of two V2 vectors.
-- - 1st: The first V2 vector.
-- - 2nd: The second V2 vector.
-- = A new V2 vector with each component being the maximum of the corresponding components of the input vectors.
max : V2 → V2 → V2
max (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (F64.max x1 x2) (F64.max y1 y2)

