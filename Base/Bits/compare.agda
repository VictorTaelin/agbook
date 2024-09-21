module Base.Bits.compare where

open import Base.Bits.Type
open import Base.Ordering.Type
open import Base.Bool.if
import Base.Bits.eq as Bits
import Base.Bits.lt as Bits

compare : Bits → Bits → Ordering
compare x y = 
  if (Bits.eq x y) then
    EQ
  else if (Bits.lt x y) then
    LT
  else
    GT
