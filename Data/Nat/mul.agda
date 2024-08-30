module Data.Nat.mul where

open import Data.Nat.Main
open import Data.Nat.add

-- Multiplication of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = The product of m and n.
_*_ : Nat → Nat → Nat
zero   * n = zero
succ m * n = n + (m * n)

{-# BUILTIN NATTIMES _*_ #-}
