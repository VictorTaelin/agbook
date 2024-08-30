module Nat.add where

open import Nat.Main

-- Addition of natural numbers
-- - m: the first natural number
-- - n: the second natural number
-- = the sum of m and n
_+_ : Nat → Nat → Nat
zero + n = n
(succ m) + n = succ (m + n)

{-# BUILTIN NATPLUS _+_ #-}
