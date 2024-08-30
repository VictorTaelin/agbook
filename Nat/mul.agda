module Nat.mul where

open import Nat.Main
open import Nat.add

-- Multiplies two natural numbers
-- - m: the first natural number
-- - n: the second natural number
-- = the product of m and n
mul : Nat → Nat → Nat
mul zero     _ = zero
mul (succ m) n = add n (mul m n)
