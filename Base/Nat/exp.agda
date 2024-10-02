module Base.Nat.exp where

open import Base.Nat.Nat
open import Base.Nat.mul

-- Performs exponentiation of natural numbers.
-- - 1st: The base number.
-- - 2nd: The exponent.
-- = The result of raising the base to the power of the exponent.
exp : Nat → Nat → Nat
exp m Zero     = Succ Zero
exp m (Succ n) = mul m (exp m n)

-- Infix operator for exponentiation.
_**_ : Nat → Nat → Nat
_**_ = exp

infixr 8 _**_