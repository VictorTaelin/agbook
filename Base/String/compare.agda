module Base.String.compare where

open import Base.String.Type
import Base.String.eq as String
import Base.String.lt as String
open import Base.Ordering.Type
open import Base.Bool.Type
open import Base.Bool.if

compare : String -> String -> Ordering
compare s1 s2 = 
  if (String.eq s1 s2) then
    EQ
  else if (String.lt s1 s2) then
    LT
  else
    GT
