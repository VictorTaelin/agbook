module Nat.mul where

open import Nat.Main
open import Nat.add

-- Multiplication of nats.
-- - m: the 1st nat.
-- - n: the 2nd nat.
-- = The product of m and n.
_*_ : Nat → Nat → Nat
zero   * n = zero
succ m * n = n + (m * n)

{-# BUILTIN NATTIMES _*_ #-}
