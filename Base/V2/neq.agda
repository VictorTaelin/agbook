module Base.V2.neq where

import Base.F64.eq as F64
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.not
open import Base.F64.F64
open import Base.V2.V2

-- Checks if two V2 vectors are not equal.
-- - 1st: The first V2 vector.
-- - 2nd: The second V2 vector.
-- = True if the vectors are not equal, False otherwise.
neq : V2 → V2 → Bool
neq (MkV2 x1 y1) (MkV2 x2 y2) = not ((x1 F64.== x2) && (y1 F64.== y2))

-- Infix operator for vector inequality.
_!=_ : V2 → V2 → Bool
_!=_ = neq

infix 4 _!=_