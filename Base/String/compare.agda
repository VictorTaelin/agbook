module Base.String.compare where

open import Base.String.Type
open import Base.String.eq
open import Base.String.lt
open import Base.Ordering.Type
open import Base.Bool.Type
open import Base.Bool.if

-- Compares two strings lexicographically.
-- Returns LT if the first string is less than the second,
-- EQ if they are equal, and GT if the first is greater than the second.
compare : String → String → Ordering
compare s1 s2 = 
  if (eq s1 s2) then EQ
  else if (lt s1 s2) then LT
  else GT
