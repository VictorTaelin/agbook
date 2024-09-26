module Base.Nat.half where

open import Base.Nat.Nat

-- Calculates half of a nat.
-- - n: The number to halve.
-- = The largest nat not exceeding n/2.
half : Nat -> Nat
half Zero            = Zero
half (Succ Zero)     = Zero
half (Succ (Succ n)) = Succ (half n)
