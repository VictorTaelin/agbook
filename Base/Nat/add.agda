module Base.Nat.add where

open import Base.Nat.Nat

-- Performs addition of natural numbers..
-- - 1st: natural number.
-- - 2nd: natural number.
-- = The sum of 1st and 2nd.
add : Nat → Nat → Nat
add Zero     n = n
add (Succ m) n = Succ (add m n)

{-# BUILTIN NATPLUS add #-}

-- Infix operator for addition.
_+_ : Nat → Nat → Nat
_+_ = add

infixl 6 _+_