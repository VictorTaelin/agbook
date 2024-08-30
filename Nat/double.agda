module Nat.double where

open import Nat.Main

-- Doubles a natural number
-- - n: the number to double
-- = the result of n + n
double : Nat → Nat
double zero     = zero
double (succ n) = succ (succ (double n))
