module Base.U64.compare where

open import Base.U64.Type
open import Base.Ordering.Type
open import Base.Bool.if
import Base.U64.eq as U64
import Base.U64.lt as U64

compare : U64 → U64 → Ordering
compare x y = 
  if (U64.eq x y) then
    EQ
  else if (U64.lt x y) then
    LT
  else
    GT
