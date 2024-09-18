module Base.Nat.half where

open import Base.Nat.Type

-- Calculates half of a natural number.
-- - n: The number to halve.
-- = The largest natural number not exceeding n/2.
half : Nat → Nat
half Zero            = Zero
half (Succ Zero)     = Zero
half (Succ (Succ n)) = Succ (half n)
