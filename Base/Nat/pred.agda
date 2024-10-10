module Base.Nat.pred where

open import Base.Nat.Nat

-- Returns the predecessor of a natural number.
-- 1st: The input natural number.
-- = The predecessor of the input, or Zero if the input is already Zero.
pred : Nat → Nat
pred Zero     = Zero
pred (Succ n) = n

