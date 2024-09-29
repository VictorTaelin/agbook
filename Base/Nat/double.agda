module Base.Nat.double where

open import Base.Nat.Nat

-- Doubles a nat.
-- - n: The number to double.
-- = The double of n.
double : Nat → Nat
double Zero     = Zero
double (Succ n) = Succ (Succ (double n))
