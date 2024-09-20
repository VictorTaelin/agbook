module Base.Nat.sub where

open import Base.Nat.Type

-- Subtraction of natural numbers.
-- - m: The minuend (number to subtract from).
-- - n: The subtrahend (number to subtract).
-- = The difference between m and n, or Zero if n > m.
sub : Nat → Nat → Nat
sub Zero     _        = Zero
sub m        Zero     = m
sub (Succ m) (Succ n) = sub m n

-- Infix operator for subtraction
_-_ : Nat → Nat → Nat
_-_ = sub

{-# BUILTIN NATMINUS _-_ #-}