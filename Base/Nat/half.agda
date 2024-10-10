module Base.Nat.half where

open import Base.Nat.Nat

-- Calculates half of a natural number.
-- 1st: The number to halve.
-- = The result of the division by 2, rounded down.
half : Nat → Nat
half Zero            = Zero
half (Succ Zero)     = Zero
half (Succ (Succ n)) = Succ (half n)

