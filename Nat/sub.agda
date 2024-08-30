module Nat.sub where

open import Nat.Main

-- Subtracts one nat from another.
-- - m: the number to subtract from.
-- - n: the number to subtract.
-- = The result of m - n, or zero if n > m.
_-_ : Nat → Nat → Nat
m      - zero   = m
zero   - _      = zero
succ m - succ n = m - n

{-# BUILTIN NATMINUS _-_ #-}
