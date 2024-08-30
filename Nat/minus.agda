module Nat.minus where

open import Nat.Main

-- Subtracts one natural number from another
-- - m: the number to subtract from
-- - n: the number to subtract
-- = the result of m - n, or zero if n > m
_-_ : Nat → Nat → Nat
m      - zero   = m
zero   - _      = zero
succ m - succ n = m - n

{-# BUILTIN NATMINUS _-_ #-}
