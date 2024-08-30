module Nat.double where

open import Nat.Main

-- Doubles a nat.
-- - n: the number to double.
-- = The double of n.
double : Nat → Nat
double zero     = zero
double (succ n) = succ (succ (double n))
