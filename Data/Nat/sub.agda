module Data.Nat.sub where

open import Data.Nat.Type

-- Subtracts one nat from another.
-- - m: The number to subtract from.
-- - n: The number to subtract.
-- = The result of m - n, or zero if n > m.
_-_ : Nat → Nat → Nat
m      - Zero   = m
Zero   - _      = Zero
Succ m - Succ n = m - n

{-# BUILTIN NATMINUS _-_ #-}
