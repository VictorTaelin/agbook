module Base.Nat.div where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.div.go

-- Performs integer division of natural numbers.
-- 1st: The dividend.
-- 2nd: The divisor.
-- = The quotient of the division operation.
div : Nat → Nat → Nat
div m Zero     = Zero  -- Division by zero returns zero.
div m (Succ n) = go Zero n m n

-- Infix operator for division.
_/_ : Nat → Nat → Nat
_/_ = div

infixl 7 _/_