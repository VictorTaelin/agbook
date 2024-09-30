module Base.F64.compare where

import Base.F64.eq as F64
import Base.F64.lt as F64
open import Base.Bool.if
open import Base.F64.F64
open import Base.Ordering.Ordering

compare : F64 → F64 → Ordering
compare x y = 
  if (F64.eq x y) then
    EQ
  else if (F64.lt x y) then
    LT
  else
    GT
