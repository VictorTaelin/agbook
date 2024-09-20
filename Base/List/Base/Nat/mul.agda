module Base.Nat.mul where

open import Base.Nat.Type
open import Base.Nat.add

-- Multiplication of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = The product of m and n.
mul : Nat → Nat → Nat
mul Zero     _ = Zero
mul (Succ m) n = n + (mul m n)

_*_ : Nat → Nat → Nat
_*_ = mul

infixl 7 _*_

{-# BUILTIN NATTIMES _*_ #-}