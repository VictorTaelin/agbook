module Data.Nat.double where

open import Data.Nat.Main

-- Doubles a nat.
-- - n: The number to double.
-- = The double of n.
double : Nat → Nat
double zero     = zero
double (succ n) = succ (succ (double n))
