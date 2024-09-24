module Base.Float.compare where

open import Base.Float.Type
open import Base.Ordering.Type
open import Base.Bool.if
import Base.Float.eq as Float
import Base.Float.lt as Float

compare : Float -> Float -> Ordering
compare x y = 
  if (Float.eq x y) then
    EQ
  else if (Float.lt x y) then
    LT
  else
    GT
