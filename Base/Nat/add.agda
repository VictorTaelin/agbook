module Base.Nat.add where

open import Base.Nat.Nat

-- Addition of nats.
-- - m: The 1st nat.
-- - n: The 2nd nat.
-- = The sum of m and n.
add : Nat → Nat → Nat
add Zero     n = n
add (Succ m) n = Succ (add m n)
{-# BUILTIN NATPLUS add #-}

_+_ : Nat → Nat → Nat
_+_ = add

infixl 6 _+_
