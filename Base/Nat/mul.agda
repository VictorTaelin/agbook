module Base.Nat.mul where

open import Base.Nat.Nat
open import Base.Nat.add

-- Performs multiplication of natural numbers.
-- - 1st: The natural number.
-- - 2nd: The natural number.
-- = The product of the two natural numbers.
mul : Nat → Nat → Nat
mul Zero     n = Zero
mul (Succ m) n = add n (mul m n)

{-# BUILTIN NATTIMES mul #-}

-- Infix operator for multiplication.
_*_ : Nat → Nat → Nat
_*_ = mul

infixl 7 _*_