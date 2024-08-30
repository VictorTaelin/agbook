module Nat.add where

open import Nat.Main

-- Adds two natural numbers
-- - m: the first natural number
-- - n: the second natural number
-- = the sum of m and n
add : Nat → Nat → Nat
add zero     n = n
add (succ m) n = succ (add m n)
