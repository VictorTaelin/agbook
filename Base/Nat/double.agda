module Base.Nat.double where

open import Base.Nat.Nat

-- Doubles a natural number.
-- - 1st: The natural number to be doubled.
-- = The double of the input number.
double : Nat → Nat
double Zero     = Zero
double (Succ n) = Succ (Succ (double n))

