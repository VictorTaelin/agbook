module Base.Nat.pred where

open import Base.Nat.Type

-- Returns the predecessor of a natural number.
-- - n: The input natural number.
-- = The predecessor of n, or Zero if n is already Zero.
pred : Nat → Nat
pred Zero     = Zero
pred (Succ n) = n
