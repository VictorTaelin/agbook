module Base.Nat.sub where

open import Base.Nat.Nat

-- Subtracts one nat from another.
-- - m: The number to subtract from.
-- - n: The number to subtract.
-- = The result of m - n, or zero if n > m.
sub : Nat → Nat → Nat
sub m        Zero     = m
sub Zero     (Succ n) = Zero
sub (Succ m) (Succ n) = sub m n
{-# BUILTIN NATMINUS sub #-}

_-_ : Nat → Nat → Nat
_-_ = sub

infixl 6 _-_
