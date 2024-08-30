module Nat.times where

open import Nat.Main
open import Nat.add

-- Multiplication of natural numbers
-- - m: the first natural number
-- - n: the second natural number
-- = the product of m and n
_*_ : Nat → Nat → Nat
zero * n = zero
(succ m) * n = n + (m * n)

{-# BUILTIN NATTIMES _*_ #-}
