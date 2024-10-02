module Base.Nat.sub where

open import Base.Nat.Nat

-- Subtracts one natural number from another.
-- - 1st: The number to subtract from.
-- - 2nd: The number to subtract.
-- = The result of 1st - 2nd, or zero if 2nd > 1st.
sub : Nat → Nat → Nat
sub m        Zero     = m
sub Zero     (Succ n) = Zero
sub (Succ m) (Succ n) = sub m n

{-# BUILTIN NATMINUS sub #-}

-- Infix operator for subtraction of natural numbers.
_-_ : Nat → Nat → Nat
_-_ = sub

infixl 6 _-_